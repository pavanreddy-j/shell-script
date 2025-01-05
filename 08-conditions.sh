#1/bib/bash

NUMBER=$1
# -gt, -et, -eq, -ne, -ge, -le 

if [  $NUMBER -gt 100]
then
    echo "given number is greater than 100"
else
    echo "given number is less than 100 or equal to 100"
fi