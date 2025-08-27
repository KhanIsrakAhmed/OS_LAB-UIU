#!/bin/bash
#read the .txt files in current folder and delete the files thst has 'virus" or 'worm'written inside

for ((i=0; i<10; i++))
do 
    touch "$i.txt"
    
    if (( i % 3 == 0 )); then
        echo "VIRUS ******" > "$i.txt"
    elif (( i % 5 == 0 )); then
        echo "WORM ******" > "$i.txt"
    else
        echo "Israk" > "$i.txt"
    fi
done
