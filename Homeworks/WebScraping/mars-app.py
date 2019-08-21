from flask import Flask, render_template
from flask_pymongo import PyMongo
import scrape_mars

app = Flask(__name__)

# Use PyMongo to establish Mongo connection
conn = 'mongodb+srv://prernagupta:Pgma1993@cluster0-khfmz.mongodb.net/test'
mongo = PyMongo(app, uri=conn)


@app.route("/")
def index():
    mars = mongo.db.mars.find_one()
    return render_template("mars-index.html", mars=mars)


@app.route("/scrape")
def scrape():
    mars = mongo.db.mars
    mars_data = scrape_mars.scrape_all()
    mars.update({}, mars_data, upsert=True)
    return "Scraping Successful!"


if __name__ == "__main__":
    app.run()