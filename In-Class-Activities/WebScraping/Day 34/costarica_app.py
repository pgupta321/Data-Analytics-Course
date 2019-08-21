from flask import Flask, render_template, redirect
from flask_pymongo import PyMongo
from costarica_scrape import scrape_info

# Create an instance of Flask
app = Flask(__name__)

# Use PyMongo to establish Mongo connection
conn = 'mongodb+srv://prernagupta:Pgma1993@cluster0-khfmz.mongodb.net/test'
mongo = PyMongo(app, uri=conn)


# Route to render index.html template using data from Mongo
@app.route("/")
def home():

    # Find one record of data from the mongo database
    destination_data = mongo.db['Vacay'].collection['CostaRica'].find_one()
    
    # Return template and data
    return render_template("costarica.html", vacation=destination_data)


# Route that will trigger the scrape function
@app.route("/scrape")
def scrape():

    # Run the scrape function and save the results to a variable
    costa_data = scrape_info()

    # Update the Mongo database using update and upsert=True
    mongo.db['Vacay'].collection['CostaRica'].update({}, costa_data, upsert=True)

    # Redirect back to home page
    return redirect("/")


if __name__ == "__main__":
    app.run(debug=True)