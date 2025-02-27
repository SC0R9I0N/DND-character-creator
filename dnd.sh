#!/bin/bash

read -p "Welcome to my DnD campaign. Sorry I couldn't make it to the session. In my stead, take this script to go through my campaign. Hit enter to continue."

echo ""

read -p "Great, I'm glad you are deciding to join the campaign. First let's start with a character class to play. Hit enter to see the classes."

echo ""

echo "The list contains most of the 5e classes. Please type out the number of the class you'd like to play (you can change it later on):
1 - Barbarian
2 - Bard
3 - Cleric
4 - Druid
5 - Fighter
6 - Monk
7 - Paladin
8 - Ranger
9 - Rogue
10 - Sorcerer
11 - Warlock
12 - Wizard
"

read class
level=1
abilities=("Strength" "Dexterity" "Constitution" "Intelligence" "Wisdom" "Charisma")
scores=(8 8 8 8 8 8)
points=27

echo ""

case $class in
	1)
		type="Barbarian"
		hit=12
		;;
	2)
		type="Bard"
		hit=8
		;;
	3)
		type="Cleric"
		hit=8
		;;
	4)
		type="Druid"
		hit=8
		;;
	5)
		type="Fighter"
		hit=10
		;;
	6)
		type="Monk"
		hit=8
		;;
	7)
		type="Paladin"
		hit=10
		;;
	8)
		type="Ranger"
		hit=10
		;;
	9)
		type="Rogue"
		hit=8
		;;
	10)
		type="Sorcerer"
		hit=6
		;;
	11)
		type="Warlock"
		hit=8
		;;
	12)
		type="Wizard"
		hit=6
		;;
	*)
		echo "Invalid choice, please enter a number between 1 and 12"
		exit 1
		;;
esac

echo "Great, you've chosen to play as a $type with a hit die of $hit"

echo ""

sleep 3

echo "Now that you've chosen a class, it's time to use up your points for your ability scores."

echo ""

# function to display scores

display_scores() {
	echo "Current Ability Scores:"
	for i in "${!abilities[@]}"; do
		echo "${abilities[$i]}: ${scores[$i]}"
	done
	echo "Remaining Points: $points"
	echo ""
}

# function for cost of increasing ability scores
cost_of_scores() {
	local score=$1
	if [ $score -le 13 ]; then
		echo 1
	else
		echo 2
	fi
}

# function to adjust ability scores
adjust_scores() {
	local ability=$1
	local change=$2
	for i in "${!abilities[@]}"; do
		if [ "${abilities[$i]}" == "$ability" ]; then
			local current_score=${scores[$i]}
			local new_score=$((current_score + change))
			local current_cost
			local new_cost

			current_cost=$(cost_of_scores $current_score)
			new_cost=$(cost_of_scores $new_score)

			if [ $new_score -ge 8 ] && [ $new_score -le 15 ]; then
				local total_points=$((points - change * new_cost + change * current_cost))
				if [ $total_points -ge 0 ]; then
					scores[$i]=$new_score
					points=$total_points
					echo "$ability adjusted by $change points. New score: ${scores[$i]}, Remaining points: $points"
				else
					echo "Not enough points to increase $ability to $new_score."
				fi
			else
				echo "Invalid adjustment for $ability. Scores must be between 8 and 15."
			fi
		fi
	done
}

# main loop to adjust ability scores
while true; do
	display_scores
	echo "Enter the ability you want to adjust (or 'exit' to finish):"
	read ability
	if [ "$ability" == "exit" ] && [ $points -gt 0 ]; then
		echo "You still have points to spend. Please use all your points before exiting."
		continue
	elif [ "$ability" == "exit" ] && [ $points -eq 0 ]; then
		break
	fi
	echo "Enter the change in points (e.g., +1 or -1):"
	read change
	adjust_scores "$ability" "$change"
done

echo ""
echo "Final Ability Scores:"
display_scores
