# Flask app
from flask import Flask

server = Flask(__name__)

@server.route("/")
def hello():
    return "Hello world"

if __name__ == '__main__':
    server.run(host='0.0.0.0')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
