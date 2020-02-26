#!/bin/bash -x
# Constants
IS_HEADS=0
IS_TAILS=1
# To generate random and print heads or tails accordingly
outcomeCheck=$((RANDOM%2))
if(($outcomeCheck==$IS_HEADS))
	then
		echo "Heads"
	else
		echo "Tails"
fi
