# JBoss Swarm - Ceylon

This project is experimental and is being done for fun in my spare time. Another important point is that its my first time using JBoss Swarm, so do not blame ;).

Also, this project is strong based on [JBoss Swarm - Examples](https://github.com/wildfly-swarm/wildfly-swarm-examples/tree/master/jpa-jaxrs-cdi)

## Setup

Prerequisites:
- Ceylon 1.3.1-snapshot
- gradle 3.0+
- Ceylon Swarm plugin

Eclipse:
- Import project as eclipse project.
- In the project folder run: `gradle compileCeylon`
- Refresh the project in eclipse.

## Run

- Create the executable jar in the project folder: `ceylon swarm --provided-module javax:org.wildfly.swarm:jaxrs jaxrs.example/1.0.0`
- Run the executable jar created: `java -jar jaxrs.example-1.0.0-swarm.jar`

## Using the service:

- Query All
 - http://localhost:8080/rest/employee

- Persist Employee
 - POST http://localhost:8080/rest/employee
```json
{
    "name" : "Diego Coronel"
}
```
