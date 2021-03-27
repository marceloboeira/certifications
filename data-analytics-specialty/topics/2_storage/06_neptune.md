# Amazon Neptune

Amazon Neptune is a fast, reliable, fully managed graph database service that makes it easy to build and run applications that work with highly connected datasets.

## Abstractions

* Node - contains data
* Data - info/properties
* Edge - connections between nodes

### Interface Languages

* Apache TinkerPop Gremlin
  * Grapsh Structure: Property
  * Interface: WebSocket
  * QueryPattern: Traversal
* SparQL Protocol
  * Grapsh Structure: RDF - Resource Description Framework
  * Interface: HTTP Rest
  * QueryPattern: SQL

## Internals

* Replication in the storage level
* MultiAZ Deployments
* Fully Managed
* Paramete groups
