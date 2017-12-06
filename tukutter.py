import MySQLdb
from flask import Flask, render_template,request,redirect

application = Flask(__name__)

@application.route('/') #トップ画面
def index():

    #ログイン画面にリダイレクトさせる
    return redirect('http://localhost:8080/login')

@application.route('/login') #ログイン画面>> SQLとその値の渡し方？が面倒そう。。。
def top():

    loginid = request.form['loginid']
    password = request.form['password']

    #mysqlに接続する 　以下のdbとconは変数
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #全部のlogin_idを取得する？
    sql = 'select ' #受け取ったloginidがDBにあるかどうか探す？
    con.execute(sql)

    #値を2次元配列で取得。
    result = con.fetchall()

    #DBの切断
    db.close()
    con.close()

    #一覧のデータを？.htmlに渡して、ループで表示させる
    return render_template('login.html')

@application.route('/regist') #ユーザー登録画面
def show_new():

    #新規登録画面を表示する
    return render_template('registration.html')

@application.route('/regist', methods=['POST']) #新規ユーザー登録処理>上の('/regist')とは違うのでOK add1206
def donew():

    #まずはformの値から、本文を取得する>>スライド03-10>POST値の取得 << add17120620:30
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

#profile編集画面を表示する。
#useridでuserテーブルから情報を取得して、画面に埋め込む。
@application.route('/edit/<_id>')
def show_edit(userid = None):

    #mysqlに接続する
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #useridをたよりuserの内容を取得する
    sql = "SELECT * FROM todo WHERE id LIKE %s"
    con.execute(sql,[userid])
    result = con.fetchall()

    #DBの切断
    db.close()
    con.close()

    task = result[0][0] #1行目の1項目。一つしか取れなくても、配列の入れ子で来る

    #編集画面を表示する
    return render_template('profile_edit.html',userid=userid,user=user)

@application.route('/edit', methods=['POST']) #profile_edit.htmlに入力された値を渡す処理
def doedit():

    #まずはformの値から、idと本文を取得する
    userid = request.form['userid']
    user = request.form['user']

    #DBの接続
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #idをたよりに、新しく変更されたuserの内容をupdateする
    sql = 'UPDATE user SET task = %s WHERE id = %s'
    con.execute(sql,[task,task_id])
    db.commit()

    #DBの切断
    db.close()
    con.close()

    #編集が終わったら、プロフィール画面へジャンプする
    return redirect('http://localhost:8080/profile')

#userを削除する>>退会処理？
@application.route('/delete/<userid>')
def delete_item(userid=None):

    #mysqlに接続する
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter_db', charset='utf8')
    con = db.cursor()

    #delete文をつかってidをたよりに、userの行を削除する
    sql = 'DELETE FROM user WHERE id=%s'

    con.execute(sql,[userid]) #変数はクォーテーションを外すのを忘れずに、あと（）閉じも忘れずに
    db.commit()

    #DBの切断
    db.close()
    con.close()
    #編集が終わったら、ログイン画面へジャンプする
    return redirect('http://localhost:8080/login')
pass
