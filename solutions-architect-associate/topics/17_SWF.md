# SWF
> Simple Workflow Service

A simple way to coordinate work across distributed application components.

* Design and coordinate tasks
* Tasks can be steps, messages, invokable code, service-calls, human action or scripts...
* Not so covered on the exam
* SWF execution flows last up to 1 year
* Task-oriented API
* Ensures exatcly-once "assignment" of a task, it is never duplicated
* Keeps track of all events and tasks of an application

## SWF Actors

* Workflow starters - An application that can initiate a workflow
* Deciders - controls the flow of the activity
* Activity workers - perform the activities
