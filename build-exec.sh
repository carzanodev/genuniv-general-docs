#!/bin/bash

echo "Cleaning and installing dependencies.."
./mvnw -f ../genuniv-common-util clean install
./mvnw -f ../genuniv-common-service clean install

echo "Cleaning and packaging the services"
./mvnw -f ../genuniv-general-info-service clean package
./mvnw -f ../genuniv-college-service clean package
./mvnw -f ../genuniv-personal-records-service clean package
./mvnw -f ../genuniv-enrolment-service clean package

echo "Running all through docker-compose.."
docker-compose -p genuniv up