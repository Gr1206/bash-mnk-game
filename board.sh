#! /bin/bash
source ./pieces.sh

declare -a board

function printBoard() { #1 M 2 N
	
	for (( i=0; i < $1 ; i++ ))
	do 
		for(( j=0; j < $2 ; j++ ))
		do
			index=$i*$N+$j
			echo -n "${board[$index]}"
			if (( $j < $2 - 1 ))
			then
				echo -n "$LATERAL_LIMIT"
			fi						
		done
		echo ""
		if (( $i < $1 ))
		then
			for (( x=0; x < $2 + $2 - 1; x++)) #coloca os delimitadores ao fim de cada linha
			do
				echo -n "$BOTTOM_LIMIT"
			done
		fi
		echo ""
	done
	

}

function initBoard() { #1 M; 2 N

	for (( i=0; i < $1 * $2; i++ ))
	do
		board[$i]=$DEFAULT_PIECE
	done
}

function setPiece() { #1 Coordinate index; 2 player
	
	board[$1]=${playerPiece[$2]}
}


