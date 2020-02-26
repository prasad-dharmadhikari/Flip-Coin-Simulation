#!/bin/bash -x

#variables

H=0
T=0
HH=0
HT=0
TH=0
TT=0
HHH=0
TTT=0
HTT=0
THH=0
HHT=0
TTH=0
HTH=0
THT=0
declare -A coinDictionary
coinDictionary=([H]=$H [T]=$T [HH]=$HH [HT]=$HT [TH]=$TH [TT]=$TT [HHH]=$HHH [TTT]=$TTT [HTT]=$HTT [THH]=$THH [HHT]=$HHT [TTH]=$TTH [HTH]=$HTH [THT]=$THT)

# For loop for singlet combination

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
echo "------------------------------------------------------------------------------------"


read -p "How many times do you want to flip a coin for triplet combination?:" noOfFlips3
for((flipCount=1;flipCount<=$(($noOfFlips3*3));flipCount++))
do
	case $((RANDOM%8)) in
		0) coinDictionary[HHH]=$((${coinDictionary[HHH]}+1))
		;;
		1) coinDictionary[TTT]=$((${coinDictionary[TTT]}+1))
		;;
		2) coinDictionary[HTT]=$((${coinDictionary[HTT]}+1))
		;;
		3) coinDictionary[THH]=$((${coinDictionary[THH]}+1))
		;;
		4) coinDictionary[HHT]=$((${coinDictionary[HHT]}+1))
		;;
		5) coinDictionary[TTH]=$((${coinDictionary[TTH]}+1))
		;;
		6) coinDictionary[HTH]=$((${coinDictionary[HTH]}+1))
		;;
		7) coinDictionary[THT]=$((${coinDictionary[THT]}+1))
		;;
	esac
done

for key in "${!coinDictionary[@]}"
do
   echo ""${key}" : "${coinDictionary[$key]}"" 
done

HHHpercentage=`echo " scale = 4 ; (${coinDictionary[HHH]}*100)/($noOfFlips3*3)" | bc -l`
echo "HHH percentage is : " $HHHpercentage

TTTpercentage=`echo " scale = 4 ; (${coinDictionary[TTT]}*100)/($noOfFlips3*3)" | bc -l`
echo "TTT percentage is : " $TTTpercentage

HTTpercentage=`echo " scale = 4 ; (${coinDictionary[HTT]}*100)/($noOfFlips3*3)" | bc -l`
echo "HTT percentage is : " $HTTpercentage

THHpercentage=`echo " scale = 4 ; (${coinDictionary[THH]}*100)/($noOfFlips3*3)" | bc -l`
echo "THH percentage is : " $THHpercentage

HHTpercentage=`echo " scale = 4 ; (${coinDictionary[HHT]}*100)/($noOfFlips3*3)" | bc -l`
echo "HHT percentage is : " $HHTpercentage

TTHpercentage=`echo " scale = 4 ; (${coinDictionary[TTH]}*100)/($noOfFlips3*3)" | bc -l`
echo "TTH percentage is : " $TTHpercentage

HTHpercentage=`echo " scale = 4 ; (${coinDictionary[HTH]}*100)/($noOfFlips3*3)" | bc -l`
echo "HTH percentage is : " $HTHpercentage

THTpercentage=`echo " scale = 4 ; (${coinDictionary[THT]}*100)/($noOfFlips3*3)" | bc -l`
echo "THT percentage is : " $THTpercentage





