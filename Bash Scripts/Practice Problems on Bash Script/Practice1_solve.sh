#!/bin/bash

cd movie_data

for file in *.txt
do
    if [ -f "$file" ]
    then 
        director=$(tail -n2 "$file" | head -n1)
        if [ ! -d "$director" ]
        then
            mkdir "$director"
        fi
        mv "$file" "$director/"
    fi

done