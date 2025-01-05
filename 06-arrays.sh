#!/bib/bash

Movies=("rrr" "monark" "munna") 

echo "First movie: ${Movies[0]}"
echo "First movie: ${Movies[2]}"
echo "First movie: ${Movies[1]}"

echo "ALL movies: ${Movies[@]}"

echo "movies: ${Movies[0], Movies[1], Movies[2]}
