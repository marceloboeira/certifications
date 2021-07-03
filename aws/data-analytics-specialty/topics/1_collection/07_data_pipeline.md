# [AWS Data Pipeline](https://aws.amazon.com/datapipeline/)

As a managed ETL (Extract-Transform-Load) service, AWS Data Pipeline allows you to define data movement and transformations across various AWS services, as well as for on-premises resources. Using Data Pipeline, you define the dependent processes to create your pipeline comprised of the data nodes that contain your data; the activities, or business logic, such as EMR jobs or SQL queries that will run sequentially; and the schedule on which your business logic executes.

### Workflow

* Data Pipeline Container
  * Data Nodes:
    * Target of Data Transformation Jobs
  * Activities:
    * Pre-packed
    * Custom Scripts
    * Pre-condictions
      * Checks before the job runs, e.g.:
        * DynamoDbTableExists
        * S3KeyExists
        * S3PrefixExists
        * ShellCommandPrecondition
  * Schedules:
    * When should it run

AWS takes care of the underlying infrastructure that runs the jobs

You can run it onpremisses by iunstalling a task-runner

### Use-cases

* Move data to AWS (Async)
* Remotely executing stored procedures (orchestrating remote tasks)
