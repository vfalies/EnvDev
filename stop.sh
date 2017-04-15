#!/bin/bash

echo Arrêt des containers...

docker-compose down --remove-orphans

echo Containers arrétés
