from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
    return ' Hello this is a static page part 2 of deployment'
    # return 'Hello World! I have been hit)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
