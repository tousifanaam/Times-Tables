#!/bin/bash
# A simple script to practice times tables

clear; max=10; count=0; level=1; best_streak=0; streak=0
echo -e "\e[93m- -\e[0m\tL E V E L\t# \e[92m$level\e[0m\t\e[93m- -\e[0m\n\e[94m-----------------------------------\e[0m\n\n" && n=0
while [ $n -eq 0 ];do
        a=$((1 + $RANDOM % $max))
        b=$((1 + $RANDOM % $max))
        read -p "●      $a * $b =  " answer
        if [ $answer -eq $(($a*$b)) ] 2>/dev/null;then
                echo -e "\e[92m●\e[0m You're absolutely correct.\e[94m ✓ \e[0m\n"
				streak=$(($streak + 1))
        else
                echo -e "\e[91m●\e[0m Incorrect answer. \e[93m[ \e[0mans: $(($a*$b))\e[93m ]\e[0m"
		if [ $streak -gt $best_streak ];then
			best_streak=$streak
			echo -e "\e[35m●\e[0m Highest Accuracy Streak\e[93m -----> \e[0m$best_streak times\e[92m ++\e[0m\n\n"
		elif [ $best_streak -eq 0 ];then
			echo -e "\e[35m●\e[0m Highest Accuracy Streak\e[93m -----> \e[0m$best_streak times\n\n"
		else
			echo -e "\e[35m●\e[0m Highest Accuracy Streak\e[93m -----> \e[0m$best_streak times\e[91m --\e[0m\n\n"
		fi
                count=-1; streak=0
        fi
        count=$(($count+1))
        if [ $count -eq 10 ];then
                clear && level=$(($level+1)) && max=$(($max+3))
                echo -e "\e[93m- -\e[0m\tL E V E L\t# \e[92m$level\e[0m\t\e[93m- -\e[0m\n\e[94m-----------------------------------\e[0m\n\n" && count=0
        fi
done
