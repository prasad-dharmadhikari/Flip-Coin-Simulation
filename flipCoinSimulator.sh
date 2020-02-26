#!/bin/bash -x

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
coinDictionary=([H]=$count1 [T]=$count2 [HH]=$count3 [HT]=$count4 [TH]=$count5 [TT]=$count6)

read -p "How many times do you want to flip a coin for singlet combination?:" noOfFlips
for((flipCount=1;flipCount<=$noOfFlips;flipCount++))
do
	case $((RANDOM%2)) in
		0) coinDictionary[H]=$((${coinDictionary[H]}+1))
		;;
		1) coinDictionary[T]=$((${coinDictionary[T]}+1))
		;;
	esac
done
# Print the dictionary of singlet combination
for key in "${!coinDictionary[@]}"
do
	echo "${key} : ${coinDictionary[$key]}" 
done
# Calculate percentage of head and percentage of tail
headPercentage=`echo " scale = 4 ; (${coinDictionary[H]}*100)/$noOfFlips" | bc -l`
tailPercentage=`echo " scale = 4 ; 100-$headPercentage" | bc -l`
echo "Percentage of heads is :" $headPercentage
echo "Percentage of tails is :" $tailPercentage
echo "----------------------------------------------------------------------------------"
read -p "How many times do you want to flip a coin for doublet combination?:" noOfFlips2
for((flipCount=1;flipCount<=$(($noOfFlips2*2));flipCount++))
do
	case $((RANDOM%4)) in
		0) coinDictionary[HH]=$((${coinDictionary[HH]}+1))
		;;
		1) coinDictionary[HT]=$((${coinDictionary[HT]}+1))
		;;
		2) coinDictionary[TH]=$((${coinDictionary[TH]}+1))
		;;
		3) coinDictionary[TT]=$((${coinDictionary[TT]}+1))
		;;
	esac
done
# Print the dictionary for doublet combination
for key in "${!coinDictionary[@]}"
do
	echo ""${key}" : "${coinDictionary[$key]}"" 
done
# Print the percentages of doublet combinations
HHpercentage=`echo " scale = 4 ; (${coinDictionary[HH]}*100)/($noOfFlips2*2)" | bc -l`
echo "HH percentage is " $HHpercentage
HTpercentage=`echo " scale = 4 ; (${coinDictionary[HT]}*100)/($noOfFlips2*2)" | bc -l`
echo "HT percentahe is " $HTpercentage
THpercentage=`echo " scale = 4 ; (${coinDictionary[TH]}*100)/($noOfFlips2*2)" | bc -l`
echo "TH percentage is " $THpercentage
TTpercentage=`echo " scale = 4 ; (${coinDictionary[TT]}*100)/($noOfFlips2*2)" | bc -l`
echo "TT percentage is " $TTpercentage


