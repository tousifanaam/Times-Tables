#!/bin/bash
# A simple script to practice times tables

clear; max=10; count=0; level=1
echo -e "\e[93m- -\e[0m\tL E V E L\t# \e[92m$level\e[0m\t\e[93m- -\e[0m\n\e[94m-----------------------------------\e[0m\n\n" && n=0
while [ $n -eq 0 ];do
        a=$((1 + $RANDOM % $max))
        b=$((1 + $RANDOM % $max))
        read -p "●      $a * $b =  " answer
        if [ $answer -eq $(($a*$b)) ];then
                echo -e "\e[92m●\e[0m You're absolutely correct.\e[94m ✓ \e[0m\n"
        else
                echo -e "\e[91m●\e[0m Incorrect answer. \e[93m[ \e[0mans: $(($a*$b))\e[93m ]\e[0m\n"
                count=-1
        fi
        count=$(($count+1))
        if [ $count -eq 10 ];then
                clear && level=$(($level+1)) && max=$(($max+3))
                echo -e "\e[93m- -\e[0m\tL E V E L\t# \e[92m$level\e[0m\t\e[93m- -\e[0m\n\e[94m-----------------------------------\e[0m\n\n" && count=0
        fi
done
