#! /bin/bash

MAX_SIZE=15

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


