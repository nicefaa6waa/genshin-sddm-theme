#!/bin/bash

NAME="genshin-sddm-theme"
DIR="/usr/share/sddm/themes/$NAME/"
CFG="/etc/sddm.conf"

function changeCurrentTheme {
    sudo sed -i "s/^Current=.*/Current=$NAME/" $CFG
    echo "Current theme changed to $NAME"
}

function disableVirtualKeyboard {
    if ! grep -wq "InputMethod=" $CFG; then
        echo -e "\nDo you want to disable the virtual on-screen keyboard in SDDM? Select yes if you have a physical keyboard"
        select sel in "Yes" "No"; do
            case $sel in
                Yes ) 
                if grep -q "^InputMethod=qtvirtualkeyboard" $CFG; then
                    sudo sed -i "s/^InputMethod=qtvirtualkeyboard/InputMethod=/" $CFG;
                    echo "Virtual keyboard disabled (modified InputMethod entry)";
                elif ! grep -q "^InputMethod=" $CFG; then
                    sudo sed -i 's/^\[General\]/\[General\]\nInputMethod=/' $CFG;
                    echo "Virtual keyboard disabled (created empty InputMethod entry)";
                fi
                break;;
                No ) break;;
            esac
        done
    fi
}

function handleMultipleAccounts {
    read -p "Enter the number of user accounts: " num_accounts
	
	> components/credentials.txt
	
    for ((i = 1; i <= num_accounts; i++)); do
        read -p "Enter the username for Account $i: " usern
        read -s -p "Enter the password for Account $i: " passn

        echo "$usern:$passn" >> components/credentials.txt
    done
}

function testTheme {
    echo -e "\nDo you want to test the theme now?"
    select sel in "Yes" "No"; do
        case $sel in
            Yes ) sddm-greeter --test-mode --theme $DIR; break;;
            No ) exit;;
        esac
    done
}

function createConfig {
    sddm --example-config | sudo tee $CFG > /dev/null
    echo "Configuration file created in $CFG"
}

    handleMultipleAccounts

if sudo cp -R . $DIR; then
    echo "Theme installed in $DIR"
else
    echo "Errors occurred during installation, exiting"
    exit;
fi

if [ ! -f $CFG ]; then
    echo -e "\nSDDM configuration file $CFG does not exist, do you want to create it based on current configuration?"
    select sel in "Yes" "No"; do
        case $sel in
            Yes ) createConfig; changeCurrentTheme; disableVirtualKeyboard; testTheme; break;;
            No ) echo "Theme installed in $DIR but configuration not changed."; testTheme; break;;
        esac
    done
else
    changeCurrentTheme; disableVirtualKeyboard; testTheme;
fi
