#!/bin/bash
#Output Student Name and Student ID to Terminal
printf '=%.0s' {1..35}
echo -e '\nPortfolio 2 \t: Guess Age'
echo -e 'Student Name \t: Justin Mahendra'
echo -e 'Student ID \t: 10526418'
printf '=%.0s' {1..35}
echo ''
#Setting for minimal and maximum. 
#These numbers define the rule for randomGenerator to generate a number between min and max
min=20
max=70
#Random Generator Function
function randomGenerator() {
    #Calculating difference between maximum and minimum and adding + 1
    ((diff=max-min+1))
    #Generating a randomNumber between the parameters
    local generatedNumber="$((min + $RANDOM%diff))"
    #Return function
    echo "$generatedNumber"
}
#This regex is used to check user input for valid integers
regex='^[0-9]+$'
#generatedNumber saves the integer that was generated by the function randomGenerator()
generatedNumber="$(randomGenerator)"
#While true loop, until user gets the correct number that was generated
while true
    do
    #Send question to the terminal and read user_input
    read -p "Enter a value between $min - $max: " user_input
    #Checking if user input is a not a valid integer by checking with regex
    if ! [[ $user_input =~ $regex ]] ; then
    #If user inputs anything that is not a valid integer, an error would be shown
    echo "Error: Not a number" >&2;
    else
    #Else if user_input is valid, check the value
        if [ $user_input -lt $min ]; then
        #If value is lower than minimum then print lower than minimum
            echo "Your input is lower than $min"
        elif [ $user_input -gt $max ]; then
        #If value is greater than maximum then print higher than maximum
            echo "Your input is higher than $max"
        else
        #Else if value is between minimum and maximum do this,
            if [ $user_input -gt $generatedNumber ]; then
            #If user value is higher than generatedNumber print Too High
                echo "Too high"
            elif [ $user_input -lt $generatedNumber ]; then
            #If user value is lower than generatedNumber print Too low
                echo "Too low"
            elif [ $user_input -eq $generatedNumber ]; then
            #If user value is equals to the generatedNumber, print Congratulations and exit the program.
                echo "Congratulations! You got the number!"
                exit 0
            fi
        fi
    fi
    done




