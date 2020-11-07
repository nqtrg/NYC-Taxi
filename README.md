# NYC-Taxi

## Introduction
This git repo keeps track of Jupyter notebooks that require *pyspark* to run. The notebooks do:
- `csv_to_parquet.ipynb`: Read the csv raw data file and export it into Parquet format

## How to run
- Install Docker and docker-compose
- Start the development server
    ```
    make lab
    ```
- Open the notebook and execute it

## Output:
- Parquet format file: `./output/tripdata.parquet/`
