#! /bin/bash


source ./input.sh #enables me to get the variables
source ./board.sh
source ./helpers.sh


function main(){
	handleGameCfg_input
	echo "M=$M, N=$N, K=$K" #game variables

	initBoard "$M" "$N"
	printBoard "$M" "$N" 
	
	setPiece 0 1
	setPiece 1 1
	setPiece 2 1
	setPiece 3 1
	setPiece 6 1
	printBoard "$M" "$N"
	getHorizontalLine "$M" "$N" 2
	getVerticalLine "$M" "$N" 0
	
	
	
	checkForWin "$K" 1 "${boardVerticalLine[@]}"		
	checkForWin "$K" 1 "${boardHorizontalLine[@]}"	
		
}

main

