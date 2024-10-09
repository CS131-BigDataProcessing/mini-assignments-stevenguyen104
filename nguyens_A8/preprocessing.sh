#!/bin/bash

# Call script with path and num of fields (also field we want to sort by [not yet])

# use path from first arg
file_name=$1

# use # fields from second arg
fields=$2

# Removes all whitespace including \t and \n
awk -F, '/,/{gsub(/\s+/, "", $0); print} ' $1 > no_ws.csv

# Places rows with exactly # fields in test.csv
awk -F, -v fields=$fields 'NF==fields' no_ws.csv > test.csv

# Places rows with no empty values in full.csv
awk -F, '{for(i=1;i<=NF;i++)if($i==""){next}}1' test.csv > full.csv

# Sorts by price (10th column) and places all non-duplicate rows in unique.csv
sort -u -n -t, -k 10,10  full.csv > unique.csv

# Find total rows
total_rows=$(awk -F, 'END{print NR}' unique.csv)

# Q1_pos = total_rows/4 (roughly), Q2_pos = total_rows/2 (roughly), Q3_pos = total_rows*3/4 (roughly)
let "Q1_pos = $total_rows/4"
let "Q2_pos = $total_rows/2"
let "Q3_pos = $total_rows*3/4"

Q1=$(awk -F, 'NR=='$Q1_pos'{print $10}' unique.csv)
Q2=$(awk -F, 'NR=='$Q2_pos'{print $10}' unique.csv)
Q3=$(awk -F, 'NR=='$Q3_pos'{print $10}' unique.csv)

echo $Q1 $Q2 $Q3

let "check_val = (3/2)*($Q3-$Q1)"
let "least = $Q1-$check_val"
let "most = $Q3+$check_val"

echo $least $most

# If value is less than Q1 - check_val or Q3 + check_val, replace with median (Q2)
awk -F, '{if ($10<'$least'||$10>'$most') {$10='$Q2'; print $0} else {print $0}}' unique.csv > final.csv

