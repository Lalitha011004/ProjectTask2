#!/bin/bash
    echo Hello
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login 
    docker tag test lalithambigai011004/task2
    docker push lalithambigai011004/task2
    