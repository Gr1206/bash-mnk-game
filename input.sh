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

        askK
}

function askM(){
 	echo "Insert number of rows"
        read M

}

function askN(){

	echo "Insert number of columns"
        read N

}

function askK(){
	echo "Insert number of consecutive pieces to win"
	read K
}


