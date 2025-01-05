#1/bib/bash

NUMBER=$1
# -gt, -et, -eq, -ne, -ge, -le 

if [  $NUMBER -gt 200 ]
then
echo "given number is greater than 200"
else
echo "given number is less than 200 or equal to 200"
fi