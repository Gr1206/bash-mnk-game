#!/bin/bash

MAX_SIZE=15

declare -A coordLetters=(
	[A]=1
	[B]=2
	[C]=3
	[D]=4
	[E]=5
	[F]=6
	[G]=7
	[H]=8
	[I]=9
	[J]=10
	[K]=11
	[L]=12
	[M]=13
	[N]=14
	[O]=15
)


function handleUser_input() {
	echo "Player 1 Name:"
	read $p1
	echo "Player 2 Name:"
	read $p2

}

function handleGameCfg_input(){
        echo "-----Game Configuration-----"
        askM

	askN

        askK $M $N
}

function askM(){
	
	inputAsk "Insert number of rows:"
	M=$Num

}

function askN(){

	inputAsk "Insert number of columns:"
      	N=$Num

}

function inputAsk(){
	validInput=1
	while [ $validInput -eq 1 ]
        do
        	echo $1
                read Num
                if [ $Num -lt 15 ] && [ $Num -ge 3 ]  
                then
                	validInput=$((validInput - 1))
		
		else
                        echo "Insert a valid number"
                fi
 
         done
  }

function askK(){
	validInput=1
	while [ $validInput -eq 1 ]
	do
		echo "Insert number of consecutive pieces to win:"
		read K
		if [ $K -le 1 ] || [ $K -gt $1 ] || [ $K -gt $2 ]
		then
			echo "Insert a valid number for K"	
		else
			validInput=$((validInput - 1))
		fi 


 	done

}

function askCoordinate(){ #1 player 2 M 3 N
	validInput=1
	
	while [ $validInput -eq 1 ]
	do 
		echo "Player $1 Turn"
		echo "Insert Coordinates to place piece:"
		read coords
		len=${#coords[0]} #len of the first string array
		echo $len
		if [ $len -gt 2 ] || [ $len -lt 2 ]
		then
	 		echo "Invalid Coordinates: Format AA"
		elif [ "${coordLetters[${coords:0:1}]}" == "" ] || [ "${coordLetters[${coords:1:1}]}" == "" ]	
		then
			echo "Invalid Coordinates: Format AA"
		else
			validInput=$((validInput - 1))
		
		fi
	done
	#index = (row-1)*n + (col-1) 
	index=$(( ( (${coordLetters[${coords:0:1}]} - 1) * $3 ) + (${coordLetters[${coords:1:1}]} - 1) ))
}
