#!/bin/bash

source ./board.sh #to get the board

function getHorizontalLine() { 
	#1-M 2-N 3-COORDIndex

	indexLine=$(( $3 / $2 )) #line of coordinate
	firstIndexInLine=$(( indexLine * $2 )) #first index of the line
	lastIndexInLine=$(( firstIndexInLine + $2 - 1 )) #last index of the line

	boardHorizontalLine="${board[@]:$firstIndexInLine:(( $lastIndexInLine - $firstIndexInLine + 1 ))}"
	echo $boardHorizontalLine
}


function getVerticalLine() { #1-M 2-N 3-COORDIndex

	#loop while index is less than the board array size
	#calculate the jump which should be equals everytime 
	#The jump should be just adding N

	boardVerticalLine=() #line array

	#calculate first index
	indexCopy=$3 #store the fist index of the line
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
	echo ${boardVerticalLine[@]}

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

initBoard 3 3
getVerticalLine 3 3 1
