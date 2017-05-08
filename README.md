# WildFly Swarm and Ceylon

An example [WildFly Swarm][] service written in [Ceylon][], 
demonstrating the use of JPA, CDI, and JAX-RS. You can also
run the example on the [WildFly][] application server, and
probably on any other Java EE application server.

The project is based these [WildFly Swarm examples][].

[Ceylon]: https://ceylon-lang.org
[WildFly]: http://wildfly.org/
[WildFly Swarm]: http://wildfly-swarm.io/
[WildFly Swarm examples]: https://github.com/wildfly-swarm/wildfly-swarm-examples/tree/master/jpa-jaxrs-cdi

## Setup

### Prerequisites

You'll need the following prerequisites to get started:

- [Ceylon 1.3.1](https://ceylon-lang.org/download)
- [Ceylon Swarm plugin](https://github.com/ceylon/ceylon.swarm)

Now, go to the directory `ceylon-wildfly-swarm-jaxrs`, which
contains the example project.

### For the impatient

You can compile and run it using:
    
    ceylon plugin install ceylon.swarm
    ceylon compile && ceylon swarm --provided-module=javax.javaeeapi jaxrs.example && java -jar jaxrs.example-1.0.0-swarm.jar

And hit: <http://localhost:8080/rest/employee>

Now let's understand the individual steps...

### Compiling

To compile the example, type:

    ceylon compile

This will compile the module `jaxrs.example` into the `modules` 
subdirectory.

### Assembling the executable jar

Make sure sure that the `ceylon swarm` plugin is installed: 
   
    ceylon plugin install ceylon.swarm
   
Next, assemble the module `jaxrs.example` as an executable jar 
by running:
   
    ceylon swarm --provided-module=javax.javaeeapi jaxrs.example

This will create the file `jaxrs.example-1.0.0-swarm.jar`, which 
is an executable "fat" jar containing your service and all its 
dependencies.

### Starting the service

Run the executable jar using `java`:
   
    java -jar jaxrs.example-1.0.0-swarm.jar

You'll see *lots* of output from WildFly. The deployment is ready
when you see this message:

> INFO  [org.jboss.as.server] (main) WFLYSRV0010: Deployed "jaxrs.example-1.0.0.war" (runtime-name : "jaxrs.example-1.0.0.war")

To check that it's working, go straight to:

<http://localhost:8080/rest/employee>

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

You can use the [Insomnia REST client][] to test it.

[Insomnia REST client]: https://insomnia.rest/

## Hacking the example

Project metadata for both Eclipse and IntelliJ is included. Make 
sure you have Ceylon IDE for [Eclipse][] or [IntelliJ][] installed 
in your preferred IDE, and import the project from the folder
`ceylon-wildfly-swarm/ceylon-wildfly-swarm-jaxrs`.

To run the project in IntelliJ, open the file

    source/jaxrs/example/module.ceylon

and click the green triangle in the gutter.

Tp run the project in Eclipse, select the project or module in the
Explorer, and select 
'Run > Run As > Ceylon Java Application Packaged by WildFly Swarm'.

[Eclipse]: https://ceylon-lang.org/documentation/1.3/ide/eclipse/
[IntelliJ]: https://ceylon-lang.org/documentation/1.3/ide/intellij/

## Running on WildFly application server

To run the example on the full [WildFly][] application server, 
compile the module, and then assemble a Java web archive by typing:

    ceylon war --static-metamodel --provided-module=javax.javaeeapi jaxrs.example

This creates the file `jaxrs.example-1.0.0.war`. Copy this file to
your WildFly `deployments` directory:

    copy jaxrs.example-1.0.0.war $JBOSS_HOME/standalone/deployments/

Start WildFly, if it's not already running:

    standalone.sh --server-config=standalone.xml

And, finally, go to:

<http://localhost:8080/jaxrs.example-1.0.0/rest/employee>
