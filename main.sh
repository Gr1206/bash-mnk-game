#! /bin/bash

source ./input.sh #enables me to get the variables
source ./board.sh



function main(){
	handleGameCfg_input
	echo "M=$M, N=$N, K=$K" #game variables

	initBoard "$M" "$N"
	printBoard "$M" "$N" 


}

main
