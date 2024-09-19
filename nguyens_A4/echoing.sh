#!/bin/bash
# Activity 1
echo "The time and date are: $(date)"
echo "Let's see who is logged into the system: $(who)"
echo "For $USER, the home directory is $HOME"

# Activity 2
echo "My name is $1 and I have \$$2 in my wallet."

# Activity 3
let mathvar1="1+5"
let "mathvar2=mathvar1*20"
let mathvar3="10"
let "mathvar4=mathvar1*(mathvar2+mathvar3)"
echo "Variable 1 is $mathvar1. Variable 2 is $mathvar2. Using $mathvar3 for Variable 3, our final Variable 4 is $mathvar4."

# Activity 4
floating=$(echo "scale = 3; 4.5/1.7" | bc -l)
echo "Our floating variable is $floating"
