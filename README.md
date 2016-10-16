# JBoss WildFly Swarm - Ceylon

An example [WildFly Swarm][] service written in [Ceylon][], 
demonstrating the use of JPA and JAX-RS.

This project is experimental and is being done for fun in my 
spare time. The project is based these [WildFly Swarm examples][].

[Ceylon]: https://ceylon-lang.org
[WildFly Swarm]: http://wildfly-swarm.io/
[WildFly Swarm examples]: https://github.com/wildfly-swarm/wildfly-swarm-examples/tree/master/jpa-jaxrs-cdi

## Setup

### Prerequisites

You'll need the following prerequisites to get started:

- [Ceylon 1.3.0+](https://ceylon-lang.org/download)
- [Ceylon Swarm plugin](https://github.com/ceylon/ceylon.swarm)

If you want to use Gradle to compile the example, you'll also 
need:

- [Gradle 3.0+](https://gradle.org/gradle-download/)

Now, go to the directory `ceylon-wildfly-swarm-jaxrs`, which
contains the example project.

### Compiling

To compile the example, type:

    ceylon compile

This will compile the module `jaxrs.example` into the `modules` 
subdirectory.

Alternatively, you may compile using Gradle.

### Compiling using Gradle (Optional)

To compile the example using Gradle, type:

    gradle compileCeylon

(Note that this also generates some additional artifacts in the 
`build` subdirectory. You can clean them up later using 
`gradle clean`.)

### Packaging the executable jar

Make sure sure that the `ceylon swarm` plugin is installed: 
   
    ceylon plugin install ceylon.swarm
   
Next, repackage the module `jaxrs.example` as an executable jar 
by running:
   
    ceylon swarm --provided-module javax:org.wildfly.swarm:jaxrs jaxrs.example

This will create the file `jaxrs.example-1.0.0-swarm.jar`, which 
is an executable "fat" jar containing your service and all its 
dependencies.

### Starting the service

Run the executable jar using `java`:
   
    java -jar jaxrs.example-1.0.0-swarm.jar

You'll see *lots* of output from WildFly. The deployment is ready
when you see this message:

> INFO  [org.jboss.as.server] (main) WFLYSRV0010: Deployed "jaxrs.example-1.0.0.war" (runtime-name : "jaxrs.example-1.0.0.war")

### Testing the service

The service has the following endpoints:

- To query all `Employee`s:
  - GET <http://localhost:8080/rest/employee>
- To persist an `Employee`:
  - POST <http://localhost:8080/rest/employee>
  
    ```json
    {
      "name" : "Diego Coronel"
    }
    ```

## Hacking the example

Project metadata for both Eclipse and IntelliJ is included. Make 
sure you have Ceylon IDE for [Eclipse][] or [IntelliJ][] installed 
in your preferred IDE, and import the project.

[Eclipse]: https://ceylon-lang.org/documentation/1.3/ide/eclipse/
[IntelliJ]: https://ceylon-lang.org/documentation/1.3/ide/intellij/

## IDE Support

If you want better IDE integration please vote:

- [For IntelliJ](https://github.com/ceylon/ceylon-ide-intellij/issues/513)
- [For Eclipse](https://github.com/ceylon/ceylon-ide-eclipse/issues/1835)

The Ceylon guys really care about their community and will get it done 
if demand exists.
