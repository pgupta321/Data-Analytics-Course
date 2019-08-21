# import necessary libraries
from flask import Flask, render_template

# create instance of Flask app
app = Flask(__name__)


@app.route("/")
def echo(): return render_template("02index.html", text = "Serving up cool text from the Flask server!")

@app.route("/bonus")
def bonus(): return render_template("02bonus.html", name='Prerna', hobby = 'dancing')

if __name__ == "__main__":
    app.run(debug=True)

