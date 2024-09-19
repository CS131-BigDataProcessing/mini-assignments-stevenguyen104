#!/bin/bash

if [ $1 -gt 55 ]; then
	if [ $1 -lt 67 ]; then
		echo "cold"
	else
		if [ $1 -lt 85 ]; then
			echo "nice"
		else
			echo "hot"
		fi
	fi
else
	echo "freezing"
fi
