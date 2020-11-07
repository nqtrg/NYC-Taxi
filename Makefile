# start the lab
lab:
	docker-compose up

# check if Parquet file is good
parq:
	parq output/tripdata.parquet/part-00001-9ebaf23d-5de0-4f3c-8c4f-e8c1fa5daa97-c000.snappy.parquet
