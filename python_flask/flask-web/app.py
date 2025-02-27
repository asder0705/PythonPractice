# pip install flask
from flask import Flask, render_template, request
import requests
import json
from werkzeug.utils import secure_filename
import os
from naver_api import get_naver
app = Flask(__name__)


@app.route("/")
def index():
    return "hello, Nick"
@app.route("/hello")
def hello():
    return render_template("hello.html"
                           , content="전달 내용", name="Nick")

@app.route("/main", methods=['GET', 'POST'])
def main():
    if request.method =='POST':
        data = json.loads(request.get_data())
        print(data)
        res = requests.get("https://api.upbit.com/v1/ticker?markets="
                           + data['market'])
        return res.content
    else:
        res = requests.get("https://api.upbit.com/v1/market/all")
        coin_list = json.loads(res.content)
        print(coin_list)
        return render_template("main.html", coins=coin_list)
@app.route("/file_upload", methods=['GET','POST'])
def file_upload():
    if request.method == 'POST':
        imgPath ="./img/"
        if not os.path.exists(imgPath):
            os.mkdir(imgPath)
        f = request.files['file']
        filename = secure_filename(f.filename)
        save_path = os.path.join(imgPath, filename)
        f.save(save_path)
        return "파일 저장됨."
    else:
        return render_template("file_upload.html")
@app.route("/naver", methods=['GET','POST'])
def naver():
    if request.method == 'POST':
        data = request.get_json()
        print(data['query'])
        result = get_naver(data['query'])
        print(result)
        return result
    else:
        return render_template("naver_search.html")

if __name__ == '__main__':
    app.run(debug=True, port=5555)