# import necessary libraries
from flask import Flask, render_template

# create instance of Flask app
app = Flask(__name__)

@app.route("/")

def movies(): 

    movies =['Titanic', 'Avatar', 'Harry Potter', 'Veer Zaara', 'K3G']
    return render_template("movies.html", list = movies)

if __name__ == "__main__":
    app.run(debug=True)