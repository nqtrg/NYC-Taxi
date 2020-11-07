# NYC-Taxi

## Introduction
This git repo keeps track of Jupyter notebooks that require *pyspark* to run. These notebooks are:
- `csv_to_parquet.ipynb`
    - Load the csv raw data file and export it into Parquet format
    - Result is stored at `./output/tripdata.parquet/`
- `feature_engineering_using_sql.ipynb`
    - Feature engineering: generate new fields to the dataset above:
        - One-Hot encoding for each hour of the day
        - One-Hot encoding for each day	of the week
        - Duration in seconds of the trip
        - An int encoding to indicate if the pickup or dropoff locations were at JFK airport. (Use a bounding box from the GPS coordinates to determine this).
    - Result is stored at `./output/tripdata_features.parquet/`
    - Note: I use SQL to do the transformations but there are other options.

The dataset can be downloaded from [here](https://nyc-tlc.s3.us-east-1.amazonaws.com/trip%20data/green_tripdata_2013-09.csv). More information [here](https://registry.opendata.aws/nyc-tlc-trip-records-pds/).
## How to run
- Install `Docker` and `docker-compose` in order to build a Jupyterlab server
- The command below (can be found in Makefile) will pull a Jupyter Lab Docker image with built-in *pyspark* and start a container from the image.
    ```
    make lab
    ```
    or
    ```
    docker-compose up
    ```
- Open the notebook client at `http://127.0.0.1:8889/lab` and execute the notebooks like usual.

