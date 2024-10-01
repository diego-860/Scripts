#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

check_exit() {
        if [ $? -ne 0 ]
        then
                echo "An error occurred, please check the $errorlog file."
        fi
}

if grep -q "Red Hat" $release_file
then
        # The host is based on Red Hat
        # Run the rpm update command
        sudo dnf update -y 1>> $logfile 2>> $errorlog
        check_exit
        sudo dnf upgrade -y 1>> $logfile 2>> $errorlog
        check_exit
fi

if grep -q "debian" $release_file
then
        # The host is based on Debian
        # Run the apt update command
        sudo apt update 1>> $logfile 2>> $errorlog
        check_exit
        sudo apt dist-upgrade 1>> $logfile 2>> $errorlog
        check_exit
fi