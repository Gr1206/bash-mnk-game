#!/bin/bash

source ./board.sh #to get the board
source ./pieces.sh

function getHorizontalLine() { 
	#1-M 2-N 3-COORDIndex

	indexLine=$(( $3 / $2 )) #line of coordinate
	firstIndexInLine=$(( indexLine * $2 )) #first index of the line
	lastIndexInLine=$(( firstIndexInLine + $2 - 1 )) #last index of the line
	
	len=$2
	declare -g -a boardHorizontalLine 
	
	boardHorizontalLine=( "${board[@]:$firstIndexInLine:$len}" )
	
}

function getVerticalLine() { #1-M 2-N 3-COORDIndex

	#loop while index is less than the board array size
	#calculate the jump which should be equals everytime 
	#The jump should be just adding N
	
	declare -g -a boardVerticalLine	
	boardVerticalLine=() #line array

	#calculate first index
	local indexCopy=$3 #store the fist index of the line
	while (( $indexCopy - $2  > 0 ))
	do
		indexCopy=$(( indexCopy - $2 ))
		echo $indexCopy
	done
	

	count=0 #index counting variable 
	boardSize=${#board[@]}
	
	while [ $indexCopy -lt $boardSize ]
	do 
		boardVerticalLine[$count]=${board[$indexCopy]}
		count=$(( count + 1 ))
		indexCopy=$(( indexCopy + $2 ))
	done 
	

}


function getDiagonal() { #1-M 2-N 3-COORDIndex
	#Rules for not checking when coord is right up corner and bot left corner they don t have main diagonal
	#0XXXX 
	#1XXXX
	#2XXXX

	echo "hola"
}

function getAntiDiagonal() { #1-M 2-N 3-COORDIndex
	echo "Ola"
}

function checkForWin() { #1-K 2-PlayerNum 3-LineArray 
	local count=0			
	local maxCount=0
	local K=$1
	local player=$2
	shift 2 #avançar os dois primeiros args
	local row=("$@")
	local len=${#row[@]}
	
	

	for (( i=0; i < $len ; i++ ))
	do
		local piece="${row[i]}"
		if [[ "$piece" == "${playerPiece[$player]}" ]]			 
		then
			count=$(( count + 1 )) 
			if (( count > maxCount ))
			then	
				maxCount=$count
			fi
		else
			count=0
		fi
	done
	
	if (( $maxCount >= $K ))
	then
		echo "Player $player Won"
		finishGame=1
	fi
	


}
