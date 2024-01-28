#!/bin/bash

NAME="genshin-sddm-theme"
DIR="/usr/share/sddm/themes/$NAME/"
CFG="/etc/sddm.conf"

function displayArtAndWelcome {

    BLUE="\033[34m"
    RESET="\033[0m"
    echo -e "run"
    echo -e "${BLUE}"

echo "⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⢫⢅⣫⣾⣟⣿⣦⣝⣻⣯⠵⠛⠛⠛⠻⠿⣟⡿⣶⣅⡚⢭⡙⠿⢿⣿⣿⣿⣿⣿⣿⣿⣯⡻⢿⣿⣿⣿⣿⣿⣿⣿⣽⡽⣿⣿⣿"
echo "⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠟⡌⣣⣾⣿⠷⢛⠉⢀⡼⡃⠀⠀⠀⠀⠀⠒⠤⣀⠙⠻⣾⣻⡳⣌⢇⡢⢍⡛⢿⣿⣿⣿⣿⣿⣿⣷⡹⣿⣿⣿⣿⣿⣿⣿⣿⣝⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⡽⣱⢋⣼⡿⢋⠁⣰⠃⢀⡿⢹⠀⠀⠀⡀⠀⠀⠀⠀⠈⠓⢦⡈⠻⣽⣮⡢⠉⠲⢍⠒⡹⣿⣿⣿⣿⣿⣿⣿⣷⡽⣿⣿⣿⣿⣿⣿⣿⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣜⠞⡼⡁⣾⠋⡀⠆⣼⢡⠂⣼⠃⠋⠀⠀⠀⢡⠀⠀⠀⠀⠀⠀⠀⠙⠲⣄⠙⢷⡄⠀⠀⠀⠑⠽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠋⡼⣐⣥⡇⢁⢂⣴⡇⠇⠀⠃⠀⢁⠀⠀⠀⠀⢆⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡌⠻⣆⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡿⣛⠿⣽"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⡴⢣⠎⡼⠀⢠⢯⢿⠀⠀⠀⠀⠀⡈⡄⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡙⣧⠀⢀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣯⣷⣶⣾⣿"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡏⢰⠃⡱⢺⠇⠀⡟⢸⡃⠀⠀⠀⠀⠀⢤⠰⡄⠀⠀⠀⠀⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣌⢷⡈⢆⠀⠈⢆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⢠⣳⢠⢣⠎⠀⡜⠀⡜⡀⡧⡇⠀⠀⠀⠀⠀⠘⣄⠑⣄⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢮⣧⠀⠣⠀⠈⢧⢈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⣜⠃⡜⠁⠀⠀⡇⢰⠱⠀⡇⡇⠀⠀⠀⠀⡆⠀⠘⣆⠈⢢⡀⠀⠀⠀⠈⠛⢦⡀⠀⠀⠀⠀⠀⠀⢀⠈⢿⣧⠀⠀⠀⠈⢣⠒⡈⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⢀⡾⡜⠀⠀⡀⠀⢰⢀⡎⠁⠀⢧⠃⡀⢀⠀⠀⢱⠀⠀⠈⢧⡀⠘⠢⡀⠀⠀⠀⠀⠙⠲⣤⣀⠀⠀⠀⠀⠳⠌⢿⣧⢆⠀⠀⠈⢷⠈⡔⠙⣿⣿⣿⣿⣿⣿⣿⣿"
echo "⠀⠀⢀⣀⡤⠒⢙⣧⢃⠃⠀⠀⢀⡟⡜⠀⠀⠀⢸⡇⠑⠀⠡⡀⠀⢣⠀⠀⠀⠙⢆⡁⠌⠓⢄⡀⠀⠀⠀⠀⠉⠛⠶⣦⣤⣀⣈⣢⠻⣧⠣⡀⠀⠈⢣⡐⠡⠌⢻⣿⣿⣿⣿⣿⣿"
echo "⠀⠀⠀⠈⠉⠉⠉⡟⡘⠀⡀⠀⣼⢡⠃⠀⠀⠀⢨⣇⠀⠀⠀⠑⢄⠈⢆⠀⠀⠀⠀⠙⠢⣄⠀⠈⠑⠢⢄⣀⠀⠀⠀⠀⠈⠉⠓⠫⠽⠭⢷⣛⣖⣶⣒⣟⣲⣘⣦⠽⢛⣽⣿⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⠀⡇⡇⠀⠁⣸⢇⠎⠀⠀⠀⠀⢸⢹⡀⠀⠀⠀⠀⠑⢜⡧⡀⠀⠀⠀⠀⠀⠉⠒⠤⣀⠀⠀⠈⠉⠒⠠⠤⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡔⢋⠻⣿⣿⣿"
echo "⠀⠀⠀⠀⠀⠀⢰⠘⠀⢀⠜⢉⠎⠀⠀⠀⠀⠎⡇⠀⢣⠀⠀⠀⠀⠀⠀⠹⡍⠢⡘⢍⠉⡉⠉⠉⠑⠚⢝⡚⠥⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢉⡵⠚⢆⠂⢄⡈⢿⣿"
echo "⠀⠀⠀⠀⠀⠀⡼⡡⢔⠁⢠⠋⠀⠀⠀⡠⠊⡼⠀⠀⣠⣧⡀⠀⠀⠀⠀⠀⠱⠘⡌⠐⠌⡈⠐⠄⠀⠀⠈⠈⠢⣀⠈⠉⠒⠲⠤⠄⣀⣀⣀⣀⣀⣤⣴⣞⠑⢄⠀⠈⠣⣀⠘⢢⡙"
echo "⠀⠀⠀⢄⠀⢀⠃⠀⣀⠔⠁⠀⣀⣤⠞⠁⢰⢁⡴⠞⠋⠀⠑⠄⠀⠀⠀⠀⠀⠳⣥⠀⠀⠀⠁⠂⢄⡀⠀⠀⠀⠀⠙⠶⣦⠤⠤⡤⢤⢤⣴⣖⠛⠻⢿⣿⣷⣤⡑⢄⠀⠈⠓⢄⠘"
echo "⠀⠀⠀⠣⡉⠨⠔⢈⣀⣤⠲⠝⠊⠀⢁⢄⠞⠉⠀⠀⠀⠀⠀⠈⠢⡀⡀⠀⠀⠀⠹⡇⠀⡠⣒⣭⡶⢖⣻⣶⣤⣀⡀⠀⠈⠙⠻⠝⢋⣉⠀⠈⠙⠓⡦⢭⡻⢿⡿⣾⣷⣄⡀⠀⠑"
echo "⠀⠀⠀⠀⠜⢩⣉⣉⣁⣀⣀⡠⠄⠒⢁⡞⢀⣄⠀⠀⢀⣀⣀⡀⠀⠀⢈⠢⡀⠀⠀⠘⢆⠰⣿⠟⠋⠉⠀⠀⠀⠈⠉⠙⠒⡒⠶⢖⠒⠒⠋⠀⠀⠀⠈⠁⠋⠓⢽⣳⣯⢟⡿⣶⣄"
echo "⠀⠀⠀⢊⠔⠉⡰⢡⠠⠐⠈⠀⠀⣠⣿⢧⡀⢑⡬⢵⠶⢦⣤⣈⠆⠀⠀⠀⠨⡂⡀⠀⠈⠢⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⢀⠈⠢⣀⠀⠀⠀⠀⠀⠀⠀⢄⡈⠺⣿⡼⣣⣟"
echo "⠀⠀⡠⠓⠁⣸⠁⡘⠁⠀⠀⠀⡔⠁⣼⡄⣹⣉⣤⠞⠉⠉⠉⠉⠁⠀⠀⠀⠀⠈⠀⢄⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠉⣲⠤⣅⣂⣀⠀⠀⠀⠀⠀⠈⠲⣌⢿⣵⢺"
echo "⠀⠀⠁⠀⠀⡇⡔⡇⠀⠀⢀⠼⡄⠀⢹⡝⡍⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠐⠠⢀⡈⠂⢀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠚⢹⢣⡀⠙⢝⠻⢿⣒⢶⣶⣶⣤⣌⣻⡾⣝"
echo "⠀⠀⠣⡀⠀⡶⠀⡇⠀⠀⡎⠄⢳⠀⠀⢷⠘⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠁⠀⠀⠀⠀⠀⣐⣿⣴⣶⠇⠀⣿⡄⠀⠳⡀⠙⢮⣿⣾⢫⢞⣽⡿⠈"
echo "⠀⠀⠀⠈⠂⡇⡠⢇⠀⢸⠀⠠⠀⣳⡀⠈⢦⠈⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣼⡟⣼⠏⢀⣼⡿⡟⣄⠀⠹⡄⢺⡿⣣⠻⣜⡾⠀⠀"
echo "⠀⠀⠀⠀⠀⢣⢡⠈⠆⢯⠀⠀⡼⠁⢝⠢⢄⡓⢜⣆⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⠄⠂⠐⠒⠒⡶⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⣯⣥⣶⢿⣻⠷⡹⣌⢆⠀⡷⢸⡷⣭⠗⠋⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠑⢄⠈⠘⢤⡜⠁⠀⠀⠑⡐⠌⠛⢽⣦⠀⠀⠀⠀⠀⠀⠘⠣⠄⣀⣀⡀⠄⠊⠀⠀⠀⠀⠀⠀⠀⣠⣿⢯⣳⣛⡞⣱⡿⣭⢳⡱⢜⡸⢀⣧⣿⣷⠋⠀⠀⠄⠁⠂"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠑⠠⢀⠙⡐⡢⠤⠀⣘⠈⠆⠀⠙⢷⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠺⣿⡹⢮⢵⡏⡼⣻⣵⢫⡖⣭⠚⣤⠟⢹⡜⢇⠀⠀⠀⢀⠈⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⢃⠁⠀⢀⠎⡇⠘⠀⠀⠈⣧⠹⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠚⢂⠡⣿⡹⣏⣾⠀⠐⢍⠳⠯⣾⣖⡋⠁⠀⠈⠣⣄⣙⡲⠞⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⡠⠊⡀⠃⠀⠀⠀⠀⡼⢳⢊⡝⢫⠟⣶⣤⣀⠀⠀⠀⣀⠤⠚⠁⠐⠈⣀⠰⣷⡏⠉⠈⣇⠀⠀⠩⡀⠀⢀⡈⠑⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⣅⠄⠊⠀⠀⠀⠀⢀⠔⢀⠏⠴⣈⣃⢎⣿⢿⠿⣿⣶⣮⣅⡀⠀⠀⠀⠀⢁⣴⣿⡇⠀⠀⠙⣆⠀⠀⠐⡀⠀⠈⠑⠢⣹⡆⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⡙⢦⢣⢻⠀⠀⠀⢀⢤⠮⣐⡠⠮⢼⣒⣭⠷⣯⣿⠋⠀⠈⢷⣻⣞⡽⡿⣶⣴⣴⣿⡿⣿⠹⣄⠀⠀⠀⠑⠒⠤⠈⣂⣀⣀⠀⠈⣷⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⢠⡫⣫⠓⠮⣆⡹⢄⠀⢠⢧⡖⣋⠳⣌⢻⣯⣝⢮⣛⣧⣛⢯⡟⣶⣄⢻⣼⣽⣳⣽⡄⢸⣿⢷⡿⠀⠌⣢⠀⠀⠀⠀⠀⢰⠣⡀⣀⠗⠑⣽⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⢠⠟⣱⠃⠀⠠⢀⠙⢦⡓⢬⣙⣃⣥⠃⠈⡥⣱⣻⠉⠉⠉⠉⠉⠉⠉⠉⠉⣿⡍⣉⣨⣽⠖⡻⢷⣦⣀⣾⣷⡶⢶⢦⡤⣤⡤⣵⣍⣓⣦⡤⠊⠀⠀⠀⠀⠀⠀⠁"
echo "⠀⠀⠀⠀⠀⠀⡾⢡⠇⠀⠀⠀⠀⠀⠀⠙⣆⣿⣫⡐⠝⡢⣄⠐⢳⢣⠀⠀⠀⠀⠒⠊⣡⡴⣏⢿⡹⢧⣿⠀⡟⡗⠮⢟⣿⣼⣛⢯⡟⡾⣥⢯⣖⣩⣻⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⢰⠁⡞⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⠈⠛⠵⣬⡐⠵⡈⢯⢐⠠⢄⣠⢴⣾⠋⠀⠘⡮⣝⡲⡽⢀⣇⡹⣄⡷⠉⡽⣜⠶⣩⢷⡹⢧⡚⡴⡹⣍⢷⡀⠀⠀⠀⠀⠀⠀⠀"
echo "⣶⣶⣶⣶⣶⣾⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⢾⠀⠀⠀⢱⠈⢓⢬⡽⢂⠖⠋⢀⠜⠁⠀⠀⠀⢹⡔⢣⢻⠸⢇⠈⠙⠅⠀⡇⠸⢯⣣⢏⡼⢣⠟⣜⡱⢊⡧⢿⡄⠀⠀⠀⠀⠀⠀"
echo "⣿⣞⣷⣿⣿⣯⡻⣄⠀⠀⠀⠀⠀⠀⣠⠔⢁⠼⡇⠀⠀⠘⡀⠘⡄⠙⡷⡄⠐⢡⠤⠤⠤⢄⡀⢸⠨⢱⠘⣆⠪⢆⡀⠀⠀⠰⡀⢸⡅⢺⡜⣣⠙⡴⣉⢏⡞⣥⠻⠀⠀⠀⠀⠀⠀"
echo "⣿⣿⣿⣿⣿⣿⣿⣮⡛⣤⣀⣀⡠⣊⠤⠂⠀⠀⢹⠀⠀⠀⢇⠀⢣⠀⠘⠌⠒⠤⡷⠁⠀⠀⠎⠁⠄⠃⠜⠀⠳⢌⠻⠆⠤⠤⠌⢀⠇⠣⡔⠣⢙⠲⢤⠣⠜⢢⠛⠆⠀⠀⠀⠀"
echo "  _        _                        __            _             "
echo " (_)      | |                      / _|          (_)            "
echo "  _ ______| | _____   _____ ______| |_ _   _ _ __ _ _ __   __ _ "
echo " | |______| |/ _ \\ \\ / / _ \\______|  _| | | | '__| | '_ \\ / _\` |"
echo " | |      | | (_) \\ V /  __/      | | | |_| | |  | | | | | (_| |"
echo " |_|      |_|\___/ \\_/ \\___|      |_|  \\__,_|_|  |_|_| |_|\\__,_|"
echo "                                                                "
echo "                                                                "


    echo -e "${RESET}Welcome Traveler. Thank you for downloading genshin-sddm-theme."
    echo "Please press any button to continue."
    read -n 1 -s -r 
}

function selectOS {
    echo "Choose your operating system:"
    select os in "Ubuntu" "Kubuntu" "Arch"; do
        case $os in
            Ubuntu|Kubuntu|Arch ) installPackages $os; break;;
            * ) echo "Invalid selection. Please try again.";;
        esac
    done
}

function installPackages {
    case $1 in
        Ubuntu )
            sudo apt-get install gstreamer1.0-libav qml-module-qtmultimedia libqt5multimedia5-plugins qt6-base git-lfs
            ;;
        Kubuntu )
            sudo apt install gstreamer1.0-libav phonon4qt5-backend-gstreamer gstreamer1.0-plugins-good qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtmultimedia qt5-default qt6-base git-lfs
            ;;
        Arch )
            sudo pacman -S --needed gst-libav phonon-qt5-gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly qt5-quickcontrols qt5-graphicaleffects qt5-multimedia qt6-base git-lfs
            ;;
        * )
            echo "Error: Invalid OS option"
            ;;
    esac
}

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

    displayArtAndWelcome    
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
            Yes ) createConfig; changeCurrentTheme; selectOS; disableVirtualKeyboard; testTheme; break;;
            No ) echo "Theme installed in $DIR but configuration not changed."; testTheme; break;;
        esac
    done
else
    selectOS; changeCurrentTheme; disableVirtualKeyboard; testTheme;
fi

