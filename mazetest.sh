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

echo -e "Input"

# testing when a player hits a wall in the maze using input
echo -n "Hitting wall test - "
timeout 0.2s ./maze data/normalmaze.txt < input/hittingwall.in > tmp
if grep -q "Error: Cannot go through walls" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# testing when a player tries to goi out off the map using input and giving the appropriate error message
echo -n "Getting out of map test - "
timeout 0.2s ./maze data/normalmaze.txt < input/outofmap.txt > tmp
if grep -q "Error: Cannot move off the map " tmp;
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

# a case where the maze has width less than 5
echo -e "Width less than 5 - "
./maze < data/widthlessthanfive.txt > tmp
if grep -q "Invalid maze width" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# a case where the maze has width more than 100
echo -e "Width more than 100 - "
./maze < data/widthmorethanhundred.txt > tmp
if grep -q "Invalid maze width" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# a case where the maze has length less than 5
echo -e "Length less than 5 - "
./maze < data/lengthlessthanfive.txt > tmp
if grep -q "Invalid maze length" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# a case where the maze has length more than 100
echo -e "Length more than 100 - "
./maze < data/lengthmorethanhundred.txt > tmp
if grep -q "Invalid maze length" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# a case where column lengths are not the same
echo -e "Inconsistent column length - "
./maze < data/inconsistentcolumnlength.txt > tmp
if grep -q "Inconsistent cloumn length" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# a case where row lengths are not the same
echo -e "Inconsistent row length - "
./maze < data/inconsistentrowlength.txt > tmp
if grep -q "Inconsistent row length" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi


echo -e "Success Tests"


# testing if the map works
echo -n "Testing map  - "
timeout 0.2s ./maze data/mapwithX.txt < input/map.txt > tmp
if grep -q "You are here!" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# testing the solution of the game
echo -n "Solving the maze  - "
timeout 0.2s ./maze data/normalmaze.txt < input/solution.in > tmp
if grep -q "Congratulation, You have exited the maze!!" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

rm -f tmp

