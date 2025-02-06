#!/bin/bash
docker build -t lalithambigai011004/task2 .
docker images
docker run -d -p 8085:80 --name task2_container lalithambigai011004/task2
