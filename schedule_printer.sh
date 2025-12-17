#!/bin/bash

# File to search in
FILE="schedule_output.txt"

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File $FILE not found!"
    exit 1
fi

# Array of names to search for
NAMES=(
  "Alejandro Vasquez"
  "Alex Mitchell"
  "Athif Wulandana"
  "Carl Weis"
  "Connor Devlin"
  "Duncan Morrissey"
  "Hassaan Ejaz"
  "Hunter Stevens"
  "Joshua Born"
  "Lane Russell"
  "Marcus Bernales"
  "Matt Gruber"
  "May Miller-Ricci"
  "Michael Deutsch"
  "Pete Hanner"
  "Sam David"
  "Sam Eckmeier"
  "Sarah Eisen"
  "Sam Wlody"
  "David Ruiz"
  "Mark Rogers"
  "PJ Weaver"
  "Alex Villela"
)

# Search for each name and print results
echo "Searching for names in $FILE..."
echo "----------------------------------------"

for name in "${NAMES[@]}"; do
    echo "Results for: $name"
    echo -e "Date\t\t\t\t Primary\t Secondary"
    grep -i "$name" "$FILE"
    echo "----------------------------------------"
done

echo "Search complete."