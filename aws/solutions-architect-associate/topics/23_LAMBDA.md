# Lambda

Lambda is the ultimate abstraction layer, you don't need to worry about server provisioning, only your code.

* Pay per running code, not for server time
  * Invokation: $0.20/M requestsa
  * Duration: $0.00001667 per GB of memory per second (splited into 100ms units, e.g.: 1 GB during 150ms will be charged as 200ms)
* Continuos scaling - no need to worry about it (lambda itself, other services still)
* 2 different models:
  * Event-oriented
    * reacting to events on S3, and triggering other services, e.g.: redshift, dynamo,...
  * HTTP-API
    * Responding to API-gateway HTTP API calls and triggering/interacting with other services to provide a response
* Supports several languages:
  * Javascript
  * Ruby
  * Go
  * Java
  * Python
  * Powershell
  * C#
