#!/bin/bash -x
# Constants
IS_HEADS=0
IS_TAILS=1
HEADS=0
TAILS=1
#variables
count1=0
count2=0
count3=0
count4=0
count5=0
count6=0
count7=0
count8=0
count9=0
count10=0
count11=0
count12=0
count13=0
count14=0
declare -A coinDictionary
coinDictionary=([H]=$count1 [T]=$count2)

# Function to generate random and return heads or tails accordingly
function getFlipCoinResult()
{
	outcomeCheck=$((RANDOM%2))
	if(($outcomeCheck==$IS_HEADS))
		then
			echo $HEADS 
		else
			echo $TAILS
	fi
}
read -p "How many times do you want to flip a coin?:" noOfFlips
for((flipCount=1;flipCount<=$noOfFlips;flipCount++))
do
	if(("$(getFlipCoinResult)"==$HEADS))
	then
			coinDictionary[H]=$((${coinDictionary[H]}+1))
	else
			coinDictionary[T]=$((${coinDictionary[T]}+1))
	fi
done
# Print the dictionary of singlet combination
for key in "${!coinDictionary[@]}"
do
	echo ""${key}" : "${coinDictionary[$key]}"" 
done

headPercentage=`echo " scale = 4 ; (${coinDictionary[H]}*100)/$noOfFlips" | bc -l`
tailPercentage=`echo " scale = 4 ; 100-$headPercentage" | bc -l`
echo "Percentage of heads is :" $headPercentage
echo "Percentage of tails is :" $tailPercentage
