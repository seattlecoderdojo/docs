#!/bin/bash
# this is an interactive rock, paper, scissors game.    

echo "This is a rock paper scissors game, not a rpsls game."

# when this is 1, the game will play over and over
go=1

# this will keep track of our wins
humanwins=0
computerwins=0

while [ $go -eq 1 ]
do

    echo "Please make a choice:"
    echo "0 for rock, 1 for paper, 2 for scissors"
    read pchoice

    # get a choice between 0 and 2
    cchoice=$(($RANDOM % 3))

    if [ $pchoice -eq 0 ]
    then
        echo "you chose rock"
        if [ $cchoice -eq 0 ]
        then
            echo "computer chose rock"
            echo "you tie!"
        elif [ $cchoice -eq 1 ]
        then
            echo "computer chose paper"
            echo "you lost!"
            ((computerwins++))
        elif [ $cchoice -eq 2 ]
        then
            echo "computer chose scissors"
            echo "you won!"
            ((humanwins++))
        fi
    elif [ $pchoice -eq 1 ]
    then
        echo "you chose paper"
        if [ $cchoice -eq 0 ]
        then
            echo "computer chose rock"
            echo "you won!"
            ((humanwins++))
        elif [ $cchoice -eq 1 ]
        then
            echo "computer chose paper"
            echo "you tie!"
        elif [ $cchoice -eq 2 ]
        then
            echo "computer chose scissors"
            echo "you lost!"
            ((computerwins++))
        fi
    elif [ $pchoice -eq 2 ]
    then
        echo "you chose scissors"
        if [ $cchoice -eq 0 ]
        then
            echo "computer chose rock"
            echo "you lost!"
            ((computerwins++))
        elif [ $cchoice -eq 1 ]
        then
            echo "computer chose paper"
            echo "you won!"
            ((humanwins++))
        elif [ $cchoice -eq 2 ]
        then
            echo "computer chose scissors"
            echo "you tie!"
        fi
    else
        echo "not a valid choice, human!"
    fi

    # ask if we wanna play again
    echo "would you like to play again?"
    read -p "Enter 1 to play again, enter any other integer to quit: " go

    # add some blank lines to make the game feel less crowded
    echo ""
    echo ""
done

# close out
echo "Thanks for playing!"
echo "you won $humanwins"
echo "computer won $computerwins"

if [ $humanwins -ge $computerwins ]
then
    echo "nice job"
else
    echo "try harder next time"
fi

