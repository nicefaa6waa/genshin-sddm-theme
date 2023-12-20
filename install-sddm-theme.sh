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

function downloadFolder {
    local folder_id="$1"
    local choice="$2"
	
	
	echo -e "Do you want to download a compressed (c) or uncompressed (u) folder?"
    read -p "Enter your choice: " choice

    if [ "$choice" = "c" ]; then
        output="backgrounds/sunrisebg.mp4"
		output2="backgrounds/nightbg.mp4"
        output3="backgrounds/morningbg.mp4"
		file_id="1D_W1t5TKsqjseavUu1pc5cbLd2IhGQML"
		file2_id="1N_WUU9oHWUKI5MNsVQVZ17v_X9iN5JQt"
		file3_id="1beMx8c8DQ0oKDLJFdQE58HNqNLYjL49P"
    elif [ "$choice" = "u" ]; then
        output="backgrounds/sunrisebg.mp4"
		output2="backgrounds/nightbg.mp4"
        output3="backgrounds/morningbg.mp4"
		file_id="19Z3NEZn-dg8KSQkk1vRF4KmI5S7ztSeP"
		file2_id="1epHfOy7dXPeA-LC2MjZ_k6IqH6XimSVO"
		file3_id="1htirTt5Nuj-tN1kKIhg4z-KMtdWWwMJ8"
    else
        echo "Invalid choice. Exiting."
        exit 1
    fi
		   
            wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$file_id' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$file_id" -O $output && rm -rf /tmp/cookies.txt
			wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$file2_id' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$file2_id" -O $output2 && rm -rf /tmp/cookies.txt
			wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$file3_id' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$file3_id" -O $output3 && rm -rf /tmp/cookies.txt
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
	downloadFolder

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
