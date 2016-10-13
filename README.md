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
- From the project _ceylon-wildfly-swarm-jaxrs_ folder run: `gradle compileCeylon`
- Refresh the project in eclipse.

## Run

- Be sure that ceylon swarm plugin is installed: `ceylon plugin install ceylon.swarm`
- Create the executable jar in the project _ceylon-wildfly-swarm-jaxrs_ folder: `ceylon swarm --provided-module javax:org.wildfly.swarm:jaxrs jaxrs.example/1.0.0`
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

## IDE Support

If you want better integration please vote:
- [For intellij](https://github.com/ceylon/ceylon-ide-intellij/issues/513)
- [For eclipse](https://github.com/ceylon/ceylon-ide-eclipse/issues/1835)

Ceylon guys really matter about their community and will get done if demand exists.

