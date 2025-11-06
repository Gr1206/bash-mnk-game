#! /bin/bash


source ./input.sh #enables me to get the variables
source ./board.sh
source ./helpers.sh


function main(){
	handleGameCfg_input
	echo "M=$M, N=$N, K=$K" #game variables

	initBoard "$M" "$N"
	printBoard "$M" "$N" 
	
	local player=1
	finishGame=0
	while [ $finishGame -eq 0 ]
	do	
		askCoordinate "$player" "$M" "$N"
		setPiece "$index" "$player"
		local indexCoord=$index
		printBoard "$M" "$N"
		getHorizontalLine "$M" "$N" "$indexCoord"
		getVerticalLine "$M" "$N" "$indexCoord"
		getDiagonal "$M" "$N" "$indexCoord"
		getAntiDiagonal "$M" "$N" "$indexCoord"	
			
	
		echo "${boardVerticalLine[@]}"
		checkForWin "$K" "$player" "${boardHorizontalLine[@]}"		
		checkForWin "$K" "$player" "${boardVerticalLine[@]}"	
		checkForWin "$K" "$player" "${boardDiagLine[@]}"
		checkForWin "$K" "$player" "${boardAntiDiagLine[@]}"
		
		if [ $player -eq 1 ]
		then
			player=2
		else
			player=1
		
		fi	
	done
}

main

