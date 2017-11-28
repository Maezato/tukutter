from flask import Flask

app = Flask(__name__)

@app.route('/')
def helloworld():
    return 'hello world!'

@app.route('/mypage')
def mypagepage():
    print("この関数が動いたか見たい")
    return 'nice to meet you!'
