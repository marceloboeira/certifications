# Formats

Different overview of common data file formats used on data-analytics

### Parquet:

* Column oriented storage
* Schema is stored in the footer of the file
* Due to merging of schema across multiple files, schema evolution is a little expensive
* ideal for read-heavy data ops
* Excellent for selected column data consumption/processing
* Works with perfectly with spark since there is a vectorized reader for parquet
* Better Compression since siimlar data is stored together (column-wise)

### AVRO

* Row oriented storage
* Schema is store as json within the file/ Schema Evaluation
* Optmized for Write Heavy
* It is also a serialization and RPC Framework
* Excellent for entire-row consumption
* Excellent for schema evolution

### ORC

* Column Oriented
* Schema stored in the footer
* Schema evolution is limite to adding new columns
* Ideal for read-heavy operations
* excellent for column-oriented consumption/processing
* Works better with Hive (specific reader)

Reference:

* [Parquet vs Avro vs ORC](https://www.youtube.com/watch?v=q8uqpwxaVZw)
* [Parquet file, Avro file, RC, ORC](https://www.youtube.com/watch?v=jKfKmBdPuT4)
* [Parquet file, Avro file](https://www.youtube.com/watch?v=q8uqpwxaVZw)
