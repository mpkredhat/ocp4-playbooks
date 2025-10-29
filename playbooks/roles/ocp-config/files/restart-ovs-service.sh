#!/bin/bash

#The interface name is passed as the first argument ($1)
#The action is passed as the second argument ($2)

    #Define the interface and service we care about
    TARGET_INTERFACE="br-ex"
    SERVICE_TO_RESTART="configure-ovs.service"

    #Check if the event is for our target interface and the action is 'up' or 'dhcp4-change'
    if [[ "$1" == "${TARGET_INTERFACE}" && ( "$2" == "up" || "$2" == "dhcp4-change" ) ]]; then
        # Log the action for debugging purposes
        echo "NetworkManager Dispatcher: IP assigned to ${TARGET_INTERFACE}, restarting ${SERVICE_TO_RESTART}."

    #Restart the desired service
    systemctl restart ${SERVICE_TO_RESTART}
    fi
