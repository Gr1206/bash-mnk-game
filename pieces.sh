#! /bin/bash



declare DEFAULT_PIECE="-"

declare P1_PIECE="O"
declare P2_PIECE="X"

declare -A playerPiece=(
	[1]="X"
	[2]="O"
)

declare LATERAL_LIMIT="|"
declare BOTTOM_LIMIT="-"
