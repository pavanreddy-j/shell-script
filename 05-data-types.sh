#!/bib/bash

Number1=$1
Number2=$2

TIMESTAMP=$(date)
echo "Script executed at: $TIMESTAMP"
SUM=$(($Number1+$Number2))

echo "SUM of $Number1 and $Number2: $SUM"