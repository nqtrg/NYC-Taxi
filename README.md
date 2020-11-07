# NYC-Taxi

## Introduction
This git repo keeps track of Jupyter notebooks that require *pyspark* to run. These notebooks are:
- `csv_to_parquet.ipynb`
    - Load the csv raw data file and export it into Parquet format.
    - Result is stored at `./output/tripdata.parquet/`
- `feature_engineering_using_sql.ipynb`
    - Add these new fields to the dataset above:
        - One-Hot encoding for each hour of the day
        - One-Hot encoding for each day	of the week
        - Duration in seconds of the trip
        - An int encoding to indicate if the pickup or dropoff locations were at JFK airport. (Use a bounding box from the GPS coordinates to determine this).
    - Result is stored at `./output/tripdata_features.parquet/`

## How to run
- Install `Docker` and `docker-compose` in order to build a Jupyterlab server
- Start the development server. The command below (can be found in Makefile) will pull a Jupyter Lab Docker image with built-in *pyspark* and start a container from the image.
    ```
    make lab
    ```
    or
    ```
    docker-compose up
    ```
- Open the notebook at `http://127.0.0.1:8889/lab` and execute the notebooks like usual.

