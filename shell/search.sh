#!/bin/bash
keyword=$1
category=$2

# Further development
# 1. Use tee
# 2. $tmp

# echo "Success " $keyword
# list=$(ls /home/itet/apps/products/shell/bigdata_search)
# grep $keyword list > aa
awk '$9~/ap/ {print $0}' big_list > aa

# file_size=$()
status=$?

# if [[ -f bb ]] ; then
# 	echo "Error desu" $status
# 	exit 0
# else
# 	echo "Seiko desu" $status
# 	exit 1
# fi

if [[ $status != 0 ]] ; then
 	echo "Errorkoo" $status
 	exit 1; 
else
	echo "Seikooo" $status
fi

exit 0