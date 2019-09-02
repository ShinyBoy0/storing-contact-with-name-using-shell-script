#!/bin/bash
# (@)/ph


#type ./ph
# to see expected param3ter [new or get]


# Create file as DATABASE

PHONE=$PWD/.databaseForList.txt




# if no command line parameters ($#), there
#  or do not know, so ask what're talking about.

if [ $# -lt 1 ] ; then
	echo "Whose phone number do you want!"
exit 1
fi


# if command line parameter found ($1), and is equal to (new)

if [ $1 = "new" ] ; then

	## if there also name and phone number
	if [ $2 = -z ] ; then
		echo "Please add Name and Phone number"
	else
		shift
		echo  $* >> $PHONE
		echo $* added to database
		exit 1
	fi
exit 0

# get the name and phone

elif [ $1 = 'get' ] ; then

	# if there is any data in our database,

	if [ ! -s $PHONE ] ; then
		echo "There is nothing in our database"
		exit 1
	else
		shift
		grep  -i -q "$*" $PHONE

		if [ $? -nt 0 ] ; then
			echo "No name was found by that name!"
			exit 1
		else
			grep -i "$*" $PHONE
		fi

	exit 0
	fi
else
	echo "Sorry, use the correct keyword!"
fi;
