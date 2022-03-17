from flask import Flask, send_from_directory
from flask import request
from flask import render_template

webapp = Flask(__name__)

@webapp.route("/index.html")
def send_index():
    return render_template("index.html")

@webapp.route("/<path:path>")
def send_static(path):
    return send_from_directory('static', path)

@webapp.route("/")
def main():
    return render_template("index.html")

if __name__ == "__main__":
    webapp.run(host="0.0.0.0", port=8080)
