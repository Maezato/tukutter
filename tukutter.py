import MySQLdb
from flask import Flask, render_template,request,redirect

application = Flask(__name__)

@application.route('/')
def index():

    #ログイン画面にリダイレクトさせる
    return redirect('http://localhost:8080/login')

@application.route('/top')
def top():
    #一番重いんで、あとで！
    #mysqlに接続する 　以下のdbとconは変数
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='tukutter', charset='utf8')
    con = db.cursor()

    #全部のタスクを表示する
    sql = 'select * from '
    con.execute(sql)

    #値を2次元配列で取得。
    result = con.fetchall()

    #DBの切断
    db.close()
    con.close()

    #一覧のデータをmake_table.htmlに渡して、ループで表示させる
    return render_template('make_table.html', rows=result)

@application.route('/top')
def show_new():

    #新規追加画面を表示する
    return render_template('new_task.html')

@application.route('/new', methods=['POST'])
def donew():

    #まずはformの値から、本文を取得する
    task = request.form['task']

    #mysqlに接続する
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='myapp', charset='utf8')
    con = db.cursor()

    #取得したタスクの内容をtodoテーブルに追加する
    sql = 'insert into todo(task) value (%s)'
    con.execute(sql,[task])
    db.commit()

    #DBの切断
    db.close()
    con.close()

    #新規追加が終わったら、一覧画面へジャンプする
    return redirect('http://localhost:8080/todo')

#編集画面を表示する。
#task_idでtodoテーブルから情報を取得して、画面に埋め込む。
@application.route('/edit/<task_id>')
def show_edit(task_id = None):

    #mysqlに接続する
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='myapp', charset='utf8')
    con = db.cursor()

    #taskidをたよりにタスクの内容を取得する
    sql = "SELECT task FROM todo WHERE id LIKE %s"
    con.execute(sql,[task_id])
    result = con.fetchall()

    #DBの切断
    db.close()
    con.close()

    task = result[0][0] #1行目の1項目。一つしか取れなくても、配列の入れ子で来るんだねぇ

    #編集画面を表示する
    return render_template('edit_task.html',task_id=task_id,task=task)

@application.route('/edit', methods=['POST'])
def doedit():

    #まずはformの値から、idと本文を取得する
    task_id = request.form['task_id']
    task = request.form['task']

    #DBの接続
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='myapp', charset='utf8')
    con = db.cursor()

    #idをたよりに、新しいタスク文の内容をupdateする
    sql = 'UPDATE todo SET task = %s WHERE id = %s'
    con.execute(sql,[task,task_id])
    db.commit()

    #DBの切断
    db.close()
    con.close()

    #編集が終わったら、一覧画面へジャンプする
    return redirect('http://localhost:8080/todo')

#タスクを削除する
@application.route('/delete/<task_id>')
def delete_item(task_id=None):

    #mysqlに接続する
    db = MySQLdb.connect( user='root', passwd='Karinon04011006@', host='localhost', db='myapp', charset='utf8')
    con = db.cursor()

    #delete文をつかってidをたよりに、todoの行を削除する
    sql = 'DELETE FROM todo WHERE id=%s'

    con.execute(sql,[task_id]) #変数はクォーテーションを外すのを忘れずに、あと、（）閉じも忘れずに
    db.commit()

    #DBの切断
    db.close()
    con.close()
    #編集が終わったら、一覧画面へジャンプする
    return redirect('http://localhost:8080/todo')
pass
