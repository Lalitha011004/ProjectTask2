#!/bin/bash
    echo HELLO, How are you?
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u lalithambigai011004 -p Lali_0121
    docker tag demo lalithambigai011004/day2task2
    docker push lalithambigai011004/day2task2
    
