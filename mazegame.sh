#!/bin/bash

gcc mazegame.c -o maze


echo -e "Argument Testing"

# testing a case where the user did not input any arguments, it will not work because there should be an argument
echo -n "Testing no arguments - "
./maze > tmp
if grep -q "Usage: studentData <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# a case where the user input 2 arguments, it will not work because there should only be one argument
echo -n "Testing 2 arguments - "
./maze x x > tmp
if grep -q "Usage: studentData <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi


echo -e "File Handling"

# a case where the maze has no starting point in the maze
echo -n "Testing no starting point - "
./maze < data/nostartingpoint.txt > tmp
if grep -q "Error: No Starting Point" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# a case where there is not exit in the maze
echo -n "Testing no exit - "
./maze < data/noexit.txt > tmp
if grep -q "Error: No Exit" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "Width less than 5 - "
./maze < data/widthlessthanfive.txt > tmp
if grep -q "Invalid maze width" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "Width more than 100 - "
./maze < data/widthmorethanhundred.txt > tmp
if grep -q "Invalid maze width" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi


echo -e "Success Tests"


 

