import MySQLdb
from flask import Flask, render_template,request,redirect,make_response

application = Flask(__name__)


@application.route('/') #トップ画面>> /loginにリダイレクトさせる（済）
def index():

    #ログイン画面にリダイレクトさせる
    return redirect('http://localhost:8080/login')


@application.route('/login') #ログイン画面表示（済）
def show_login():

    #login画面を表示するためにlogin.htmlに飛ばす
    return render_template('login.html')


#ログイン処理 >> SQLとその値の渡し方に注意（済）
@application.route('/login', methods=['POST'])
def dologin():

    loginid = request.form['loginid'] #request.form['']の''の中にhtml内にあるname要素のloginidから値をゲット。
    password = request.form['password']

    #mysqlに接続する。dbはMySQLdbのオフジェクト変数。conはオブジェクト変数dbにメソッドを使って別のオブジェクトに
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #受け取ったuseridのパスワードをsql変数に代入してコミットする
    sql = 'select user_pass,user_name,user.id from user where login_id = %s' #ここはsqlに文字列としてSQL文を投げてるだけ。
    con.execute(sql,[loginid]) #上のSQLを実行する=executeメソッド
    result = con.fetchone() #受け取ったconオブジェクトの中から配列で１行だけ受け取るメソッドがfetchone()
    username = result[1]
    userid = result[2]

    #DBの切断
    db.close()
    con.close()

    if password == result[0]:
        #loginidとpasswordが一致していれば以下の処理をして
        #飛ばす前にブラウザにcookie保存して、respにredirectごと突っ込んでそのままtopに飛ばすadvice下地さん
        resp = make_response(redirect('http://localhost:8080/top'))
        resp.set_cookie('loginid', loginid) #クッキーのloginid項目にloginidをセットする
        resp.set_cookie('username',result[1]) #クッキーのusername項目にusernameをセットする
        resp.set_cookie('userid',str(result[2])) #クッキーのuserid項目にuseridをセットする（1213追加）
        return resp

    else:
        #passwordが一致してなければlogin.htmlに戻す
        return render_template('login.html')


@application.route('/regist') #ユーザー登録画面表示（済）
def show_new():

    #新規登録画面を表示する
    return render_template('registration.html')


#新規ユーザー登録処理>上の('/regist')とは違う。値を受けとって処理をするメソッド <<add1206（済）
@application.route('/regist', methods=['POST'])
def donew():

    #まずはformの値から、本文を取得する>>スライド03-10>POST値の取得 << add17120620:30
    #userid = requst.form
    loginid = request.form['loginid']
    username = request.form['username']
    password = request.form['password']

    #mysqlに接続する >>import MySQLdbのオブジェクト変数:db
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor() #import MySQLdbのメソッド:cursor()

    #取得したuserの登録内容をuserテーブルに追加する
    sql = 'insert into user(login_id,user_name,user_pass) values (%s, %s, %s)'
    con.execute(sql,[loginid,username,password]) #executeはimport MySQLdbのメソッドの１つ << add17120620:38
    db.commit()

    #DBの切断
    db.close()
    con.close()

    #新規追加が終わったらログイン画面に飛ぶ
    return render_template('login.html')


#Top画面表示 >ログインしてる人がフォローしてる人の呟きだけ表示（作業中）
@application.route('/top')
def show_top():

    #mysqlに接続する >>import MySQLdbのオブジェクト変数:db
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor() #import MySQLdbのメソッド:cursor()

    userid = request.cookies.get('userid', None) #cookieをとってくる

    #フォローしてる人のつぶやきを表示する
    sql = 'select user.user_name,follow.follower_id,tweet.tweet_comment from follow inner join user on follow.follower_id = user.id inner join tweet on follow.follower_id=tweet.user_id where follower_id=%s'
    #sql = 'select follow.follower_id from follow where follower_id=%s'
    con.execute(sql,[userid])

    #値を2次元配列で取得。
    result = con.fetchall()

    #cookieのusernameを変数usernameに代入して、user.user_name,folllow.follower_id,tweet.tweet_commentをresultに突っ込む
    #それらをtop.htmlに渡して変数htmlに代入してる。（htmlファイルに置換して書き込む）
    html = render_template('top.html',username=request.cookies.get('username', None),rows=result)

    #DBの切断
    db.close()
    con.close()
    #print(userid)
    #print(result)

    return html


#profile編集画面を表示する。useridでuserテーブルから情報を取得して、画面に埋め込む。(未)
@application.route('/edit/<_id>')
def show_proedit(userid = None):

    #mysqlに接続する
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #useridを繋げてuserの内容を取得する
    sql = "SELECT * FROM user WHERE user_id LIKE %s"
    con.execute(sql,[userid])
    result = con.fetchall()

    #DBの切断
    db.close()
    con.close()

    task = result[0][0] #1行目の1項目。一つしか取れなくても、配列の入れ子で来る

    #編集画面を表示する
    return render_template('profile_edit.html',userid=userid,user=user)

#profile編集画面を表示し入力値を受け取って処理する
@application.route('/edit', methods=['POST']) #profile_edit.htmlに入力された値を渡す処理(未)
def doproedit():

    #まずはformの値から、idと本文を取得する
    userid = request.form['userid']
    user = request.form['user']

    #DBの接続
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #idから新しく変更されたuserの内容をupdateする
    sql = 'UPDATE user SET task = %s WHERE id = %s'
    con.execute(sql,[task,task_id])
    db.commit()

    #DBの切断
    db.close()
    con.close()

    #編集が終わったら、プロフィール画面へジャンプする
    return redirect('http://localhost:8080/profile')

#userを削除する>>退会処理？
@application.route('/delete/<userid>') #useridを消す？フラグを立てるだけ？(未)
def delete_item(userid=None):

    #mysqlに接続する
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #delete文をつかってidをたよりに、userの行を削除する
    sql = 'DELETE FROM user WHERE id=%s'

    con.execute(sql,[userid]) #変数はクォーテーションを外すのを忘れずにあと()閉じも忘れずに
    db.commit()

    #DBの切断
    db.close()
    con.close()
    #編集が終わったら、ログイン画面へジャンプする
    return redirect('http://localhost:8080/login')


pass
