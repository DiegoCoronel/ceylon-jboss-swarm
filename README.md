# JBoss Swarm - Ceylon

This project is experimental and is being done for fun in my spare time.
The project is based on [JBoss Swarm - Examples][].

[JBoss Swarm - Examples]: https://github.com/wildfly-swarm/wildfly-swarm-examples/tree/master/jpa-jaxrs-cdi

## Setup

You'll need the following prerequisites:

- [Ceylon 1.3.1-snapshot](https://github.com/ceylon/ceylon/), built from source
- [Gradle 3.0+](https://gradle.org/gradle-download/)
- [Ceylon Swarm plugin](https://github.com/ceylon/ceylon.swarm)

To import the project in Eclipse:

- Import the project in Eclipse.
- From the `ceylon-wildfly-swarm-jaxrs_ folder` run:
  
      `gradle compileCeylon`
  
- Refresh the project in Eclipse.

## Run

1. Be sure that `ceylon swarm` plugin is installed: 
   
       `ceylon plugin install ceylon.swarm`
   
2. Create the executable jar in the `ceylon-wildfly-swarm-jaxrs` folder:
   
       `ceylon swarm --provided-module javax:org.wildfly.swarm:jaxrs jaxrs.example/1.0.0`
   
3. Run the executable jar:
   
       `java -jar jaxrs.example-1.0.0-swarm.jar`

## Using the service:

Endpoints:

- To query all `Employee`s:
  - GET <http://localhost:8080/rest/employee>
- To persist an `Employee`:
  - POST <http://localhost:8080/rest/employee>
  
    ```json
    {
      "name" : "Diego Coronel"
    }
    ```

## IDE Support

If you want better integration please vote:

- [For IntelliJ](https://github.com/ceylon/ceylon-ide-intellij/issues/513)
- [For Eclipse](https://github.com/ceylon/ceylon-ide-eclipse/issues/1835)

The Ceylon guys really care about their community and will get it done if demand exists.

