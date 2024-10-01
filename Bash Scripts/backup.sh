#!/bin/bash

# Check to make sure the user has entered exactly two arguments.
if [ $# -ne 2 ]
then
        echo "Usage: backup.sh <source_directory> <target_directory>"
        echo "Please try again."
        exit 1
fi

# Check to see if rsync is installed
# <command -v> is used since it's built in and not an external binary like <which>
if ! command -v rsync &> /dev/null
then
        echo "This script requires rsync to be installed."
        echo "Please use your distribution's package manager to install it and try again."
        exit 4
fi

# Capture the current date and store in the format YYYY-MM-DD into variable
current_date=$(date +%Y-%m-%d)
# Capture the <rsync> options we'd like to use and place in variable
rsync_options="-avb --backup-dir $2/$current_date --delete"
# Use <which> to use invoke <rsync>
# Use the above rsync_options variable along with the provided arguments <paths>
# Add </current> to <target_directory>
# Append rsync <-v> to the log in the provided path using the <current_date> variable
$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log