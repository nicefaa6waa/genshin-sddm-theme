#!/bin/bash

NAME="genshin-sddm-theme"
DIR="/usr/share/sddm/themes/$NAME/components/"

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


    echo -e "${RESET}Welcome Traveler. Thank you for downloading genshin-sddm-theme."
    echo "Please press any button to continue."
    read -n 1 -s -r 
}

function selectOS {
    # Auto detect OS
    if grep -q "Kubuntu" /etc/os-release; then
        installPackages Kubuntu
    elif grep -q "Fedora" /etc/os-release; then
        installPackages Fedora
    elif grep -q "Arch" /etc/os-release; then
        installPackages Arch
    elif grep -q "Ubuntu" /etc/os-release; then
        installPackages Ubuntu
    else
        echo "Choose your operating system:"
        select os in "Ubuntu" "Kubuntu" "Arch" "Fedora"; do
            case $os in
                Ubuntu|Kubuntu|Arch|Fedora ) installPackages $os; break;;
                * ) echo "Invalid selection. Please try again.";;
            esac
        done
    fi
}

function installPackages {
    case $1 in
        Ubuntu )
            sudo apt-get install gstreamer1.0-libav qml-module-qtmultimedia libqt5multimedia5-plugins qt6-base nodejs npm
            ;;
        Kubuntu )
            sudo apt install gstreamer1.0-libav phonon4qt5-backend-gstreamer gstreamer1.0-plugins-good qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtmultimedia qt5-default qt6-base nodejs npm
            ;;
        Arch )
            sudo pacman -S --needed gst-libav phonon-qt5-gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly qt5-quickcontrols2 qt5-graphicaleffects qt5-multimedia qt6-base xorg-xrandr nodejs npm --overwrite '*'
            ;;
        Fedora )
            sudo dnf install gstreamer1-plugin-libav phonon-qt4-backend-gstreamer phonon-qt5-backend-gstreamer phonon-qt6-backend-gstreamer gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer-plugins-base qt5-qtquickcontrols2 qt5-qtgraphicaleffects qt6-qtbase xrandr wlr-xrandr nodejs nodejs-npm
            ;;
        * )
            echo "Error: Invalid OS option"
            ;;
    esac
}

function handleMultipleAccounts {
    read -p "Enter the number of user accounts: " num_accounts
    
    > components/credentials.txt  

    for ((i = 1; i <= num_accounts; i++)); do
        read -p "Enter the username for Account $i: " usern
        read -s -p "Enter the password for Account $i: " passn
        echo  

       
        hashed_pass=$(node sha256.js "$passn")

       
        echo "$usern:$hashed_pass" >> components/credentials.txt
    done
}

displayArtAndWelcome
selectOS
installPackages
handleMultipleAccounts
sudo cp /components/credentials.txt $DIR