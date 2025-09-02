#!/bin/bash

for file in *.txt
do
    if grep -q -ie "virus" -ie "worm" $file
    then rm $file
    fi
done