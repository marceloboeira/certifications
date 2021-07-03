# Processing

*
*

## ETL

### Glue

Glue is used/recommended when there is no need or reason for running you own cluster EMR Cluster
* Glue Generates

# Map Reduce

* The workload is distributed across different nodes

# Pseudo-Code

```
# Imagine a 10M items list
eatables = [🍌, 🍎, 🍏, 🍕, 🍜, 🧀, 🍓, 🌯, 🍉, 🥝]

eatables
  .map(.fruit?) # Processing
  .reduce(.sum) # Aggregation
```

### Distributing the processing

The workload for 10M items would be distributed, let's say, in 2 nodes:

```
# Node1: Receives first half of the load
[🍌, 🍎, 🍏, 🍕, 🍜]
  # checks all the fruits
    # (Banana, Red Apple, Green Apple)
      # Sum: 3

# Node2: Receives second half of the load
[🧀, 🍓, 🌯, 🍉, 🥝]
  # checks all the fruits
    # (Strawberry, Watermelon, Kiwi)
      # Sum: 3
```

## Distributed File System

Considering large files, the primary node whereas applications would interface with sees the file as a normal file:

```
# Primary Node
file1 = [🍌, 🍎, 🍏, 🍕, 🍜]
file2 = [🚖, 🚗, 🚙, 🚜, 🏎 ]
```

However, the secondary nodes where the files are really stored get partial parts of the files and replicate them for consistency:

```
Secondary Node 1
file1_1 = [🍌, 🍎, 🍏]
file2_2 = [🚜, 🏎 ]

Secondary Node 2
file2_1 = [🚖, 🚗, 🚙]
file1_2 = [🍕, 🍜]

Secondary Node 3
file1_1 = [🍌, 🍎, 🍏]
file1_2 = [🍕, 🍜]
```

* Distributed - The fact that data is distributed creates paralelism when processing, since each fragment or block of the file can be processed by the resulting node
* Replicated - The fact that the data is replicated creates resiliency, if one node dies there will be at least one other node with the data stored previously by the node that died to cover for the losses.

# Hadoop - HDFS

Open-source distributed file system that supports parallel processing of large data-sets with fault-tolerant and high-throughput
