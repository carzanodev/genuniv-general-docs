# Generic University
The Generic University is a university system comprising of services built around the Microservices architectural pattern. It's designed to capture the necessary functionalities that occur around the university as an enterprise, such as the enrolment and student registration.

# Purpose
The project aims to show examples of usage of various technologies, especially those of the Java and Spring Boot stack. Since the projects are built around the Microservices architecture, introducing and integrating new technologies is even more possible and encouraged for learning purposes. 

# Design
![genuniv-base](./.assets/genuniv-base.png)

# Technology Stack
1. Java 11
2. Spring Boot
3. Spring Web
4. Spring Data JPA
5. Spring Cloud Gateway
6. Spring Cloud Netfix - Eureka
7. REST
8. Jackson JSON
9. Lombok
10. Postgres
11. Flyway
12. Redis
13. Log4j2
14. Tomcat
15. Docker

# Build, Deploy, Test
## Clone the Repositories
Create a working directory and get inside it. Get [git](https://git-scm.com/) and get each of the projects.
1. [genuniv-common-util](https://github.com/carzanodev/genuniv-common-util)
2. [genuniv-common-service](https://github.com/carzanodev/genuniv-common-service)
3. [genuniv-general-info-service](https://github.com/carzanodev/genuniv-general-info-service)
4. [genuniv-college-service](https://github.com/carzanodev/genuniv-college-service)
5. [genuniv-personal-records-service](https://github.com/carzanodev/genuniv-personal-records-service)
6. [genuniv-enrolment-service](https://github.com/carzanodev/genuniv-enrolment-service)
7. [genuniv-api-gateway](https://github.com/carzanodev/genuniv-api-gateway)
8. [genuniv-discovery-server](https://github.com/carzanodev/genuniv-discovery-server)

Example:
```shell script
git clone https://github.com/carzanodev/genuniv-common-util.git 
```

## Build and Run
Simply execute `buid-exec.sh`. 
```shell script
sh ./buid-exec.sh
```

This step will take a while as it consists of both the building and running of the services. It does so in the order of the following:
1. Cleaning then installing the genuniv dependencies
2. Cleaning then packaging the genuniv services
3. Execute docker-compose.yml
    * Install all docker images (this takes longer in the first run)
    * Prepare and run the databases in their containers
    * Prepare and run the services in their containers

## Pre-test Processes
After the services have run, you will have to wait for a while for everything to be in place. If you test the services too early, you might get an error indicating that the services aren't ready or that the necessary data of a service that is taken from another service isn't available. 

The following are what's taking place:
1. The discovery-server is launching and preparing the service registry. Since the discovery-server is exposed to the `localhost`, it can easily be checked whether it's up or not.
2. The services are registering themselves to the service registry.
3. The api-gateway is registering itself to the service registry. If the api-gateway is up, this means that we already have a means of testing the services from the `localhost`. This is because the api-gateway is also exposed to the `localhost`.
4. The already-up services are querying from the other services for their needed data.

## Testing
