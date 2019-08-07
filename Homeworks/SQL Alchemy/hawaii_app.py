import numpy as np
import pandas as pd

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

import datetime as dt
from datetime import datetime


#################################################
# Database Setup
#################################################
engine = create_engine("sqlite:///Homeworks/SQL Alchemy/hawaii.sqlite")


# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(engine, reflect=True)

Base.classes.keys()

# Save reference to the tables
Measurement = Base.classes.measurement
Station = Base.classes.station

# Create our session (link) from Python to the DB
session = Session(engine)

#################################################
# Flask Setup
#################################################
app = Flask(__name__)

#################################################
# Flask Routes
#################################################

@app.route("/")
def home():
    """List all available api routes."""
    return (
        "Available Routes:<br/>"
        "<br/>"
        "/api/v1.0/precipitation<br/>"
        "<br/>"
        "/api/v1.0/stations<br/>"
        "<br/>"
        "/api/v1.0/tobs<br/>"
        "<br/>"
        "In the below route, enter a start date to get minimum, average, and maximum temps.<br/>"
        "/api/v1.0/<start><br/>"
        "<br/>"
        "In the below route, enter a 'start date/end date' to get minimum, average, and maximum temps.<br/>"
        "/api/v1.0/<start>/<end><br/>"
    )

############################################################

@app.route("/api/v1.0/precipitation")
def precipitation():
    # Calculate the date 1 year ago from the last data point in the database
    last_date = session.query(Measurement.date).order_by(Measurement.date.desc()).first()[0]

    # This converts the date string object into a datetime object
    last_date = datetime.strptime(last_date , '%Y-%m-%d')

    year_ago = last_date - dt.timedelta(days=365)
    year_ago = year_ago.strftime('%Y-%m-%d')
    year_ago

    sel = [Measurement.date, Measurement.prcp]

    # Perform a query to retrieve the data and precipitation scores
    year_results = session.query(*sel).filter(Measurement.date > year_ago).all()


    prcp_list = [{'Date': 'Rainfall in Inches'}]
    for date, prcp in year_results:
        prcp_dict = {}
        prcp_dict[date] = prcp
        prcp_list.append(prcp_dict)

    return jsonify(prcp_list)

############################################################

@app.route("/api/v1.0/stations")
def stations():
    stations_query = session.query(Station.name, Station.station).all()
    return jsonify(stations_query)

############################################################
  
@app.route("/api/v1.0/tobs")
def tobs():

    # Calculate the date 1 year ago from the last data point in the database
    last_date = session.query(Measurement.date).order_by(Measurement.date.desc()).first()[0]

    # This converts the date string object into a datetime object
    last_date = datetime.strptime(last_date , '%Y-%m-%d')

    year_ago = last_date - dt.timedelta(days=365)
    year_ago = year_ago.strftime('%Y-%m-%d')
    year_ago

    sel = [Measurement.date, Measurement.tobs]

    # Perform a query to retrieve the temperature records
    temp_results = session.query(*sel).filter(Measurement.date > year_ago).all()

    return jsonify(temp_results)

############################################################

@app.route("/api/v1.0/<start>")
def trip1(start):

    #start_date = datetime.strptime(start, '%Y-%m-%d')

    sel = [func.min(Measurement.tobs), func.avg(Measurement.tobs), func.max(Measurement.tobs)]

    trip_data = session.query(*sel).filter(Measurement.date >= start).all()
    trip = list(np.ravel(trip_data))

    return jsonify(f'Here are the mininum temp, average temp, and maximum temp, respectively, for Hawaii from {start} to 2017-08-23:', trip)

############################################################

@app.route("/api/v1.0/<start>/<end>")
def trip2(start, end):

    sel = [func.min(Measurement.tobs), func.avg(Measurement.tobs), func.max(Measurement.tobs)]

    trip_data = session.query(*sel).filter(Measurement.date >= start).filter(Measurement.date <= end).all()
    trip = list(np.ravel(trip_data))

    return jsonify(f'Here are the mininum temp, average temp, and maximum temp, respectively, for Hawaii from {start} to {end}:', trip)

############################################################

if __name__ == "__main__":
    app.run(debug=True)