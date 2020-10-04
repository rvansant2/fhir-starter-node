#!/bin/bash
# script provided by GaTech CS-6440 - thanks @jshivers3
for file in $(pwd)/output/fhir/*
do
	curl --request POST --location "http://localhost:8090/hapi-fhir-jpaserver/fhir" --header "Content-Type:application/json" -d "@$file"
done
