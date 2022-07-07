#!/bin/bash
# Mover of fonts
# 07-07-2022
# Kevin Mocorro

echo $1

if [[ "$1" == "Trials" ]]
then
	ls $1 | while IFS= read -r file; do

    mv $1/"$file"/lc/* $1/"$file"/.
    echo "Fonts has been moved to $1/$file/"

		#cleaning
		rm -rf $1/"$file"/lc

		#change spaces to dashes
    mv -v $1/"$file" `echo $1/"$file" | tr ' ' '-'`
		

	done;
	
	ls $1 | while IFS= read -r file; do
		#lowercase filenames
    mv -v $1/"$file" `echo $1/"$file" | tr '[A-Z]' '[a-z]'`
		
		#lower case all fonts names
    for fonts in $1/"$file"/*; do mv -v "$fonts" `echo $fonts | tr '[A-Z]' '[a-z]'` ; done


	done;



else
	ls $1 | while IFS= read -r file; do

    mv $1/"$file"/Pro/Static/lc/* $1/"$file"/Pro/.
    echo "Fonts has been moved to $1/$file/Pro"
    mv $1/"$file"/Std/Static/lc/* $1/"$file"/Std/.
    echo "Fonts has been moved to $1/$file/Std"
		mv $1/"$file"/Pro/Variable/* $1/"$file"/Pro/.	

		#cleaning
		rm -rf $1/"$file"/Pro/Static
		rm -rf $1/"$file"/Pro/Variable
		rm -rf $1/"$file"/Std/Static

		#change spaces to dashes
    mv -v $1/"$file" `echo $1/"$file" | tr ' ' '-'`


	done;
	
	ls $1 | while IFS= read -r file; do
		
		#lowercase all parent folder names
    mv -v $1/"$file" `echo $1/"$file" | tr '[A-Z]' '[a-z]'`

		#lowercase every fonts inside Pro and Std
    for fonts in $1/"$file"/Pro/*; do mv -v "$fonts" `echo $fonts | tr '[A-Z]' '[a-z]'` ; done
    for fonts in $1/"$file"/Std/*; do mv -v "$fonts" `echo $fonts | tr '[A-Z]' '[a-z]'` ; done

	done;

	ls $1 | while IFS= read -r file; do

		#lower case Pro and Std folder
    mv -v $1/"$file"/Pro `echo $1/"$file"/Pro | tr '[A-Z]' '[a-z]'`
    mv -v $1/"$file"/Std `echo $1/"$file"/Std | tr '[A-Z]' '[a-z]'`


	done;

fi

echo "Moved was completed"
