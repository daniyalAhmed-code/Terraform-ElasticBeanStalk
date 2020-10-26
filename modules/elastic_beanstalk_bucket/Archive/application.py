from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
    return ' MOnday 26 October 2020 9:51 PM'
    # return 'Hello World! I have been hit)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
