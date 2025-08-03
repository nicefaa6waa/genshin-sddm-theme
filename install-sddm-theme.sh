#!/bin/bash

NAME="genshin-sddm-theme"
DIR="/usr/share/sddm/themes/$NAME/"
CFG="/etc/sddm.conf"

function displayArtAndWelcome {

    BLUE="\033[34m"
    RESET="\033[0m"
    echo -e "run"
    echo -e "${BLUE}"

echo "⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⢫⢅⣫⣾⣟⣿⣦⣝⣻⣯⠵⠛⠛⠛⠻⠿⣟⡿⣶⣅⡚⢭⡙⠿⢿⣿⣿⣿⣿⣿⣿⣯⡻⢿⣿⣿⣿⣿⣿⣿⣿⣽⡽⣿⣿⣿"
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

function detectConfigFile {
    local config_paths=(
        "/etc/sddm.conf"
        "/etc/sddm.conf.d/kde_settings.conf"
        "/usr/lib/sddm/sddm.conf.d/default.conf"
    )
    
    for config_path in "${config_paths[@]}"; do
        if [[ -f "$config_path" ]]; then
            CFG="$config_path"
            echo "Using config file: $CFG"
            return 0
        fi
    done
    
    echo "No SDDM config file found. Will create default at /etc/sddm.conf"
    CFG="/etc/sddm.conf"
    return 1
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
            sudo apt-get install gstreamer1.0-libav qml-module-qtmultimedia libqt5multimedia5-plugins qt6-base-dev nodejs npm
            ;;
        Kubuntu )
            sudo apt install gstreamer1.0-libav phonon4qt5-backend-gstreamer gstreamer1.0-plugins-good qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtmultimedia qt5-default qt6-base-dev nodejs npm
            ;;
        Arch )
            sudo pacman -S --needed gst-libav phonon-qt5-gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly qt5-quickcontrols2 qt5-graphicaleffects qt5-multimedia qt6-base xorg-xrandr nodejs npm --overwrite '*'
            ;;
    esac
}

function updateXsetupWithResolution {
    local resolution=$1
    XSETUP_FILE="/usr/share/sddm/scripts/Xsetup"
    
    XRANDR_CMD="xrandr --output eDP-1 --mode $resolution --pos 0x0 --rotate normal"
    
    if ! sudo grep -Fxq "$XRANDR_CMD" "$XSETUP_FILE"; then
        echo "$XRANDR_CMD" | sudo tee -a "$XSETUP_FILE" > /dev/null
        echo "Xsetup file updated with xrandr command for resolution $resolution."
    else
        echo "xrandr command for resolution $resolution already exists in Xsetup file."
    fi
}

function updateXsetup {
    XSETUP_FILE="/usr/share/sddm/scripts/Xsetup"

    echo -e "\nYour resolution is too high. Do you want to add an xrandr configuration for better compatibility?"
    select sel in "Yes" "No"; do
        case $sel in
            Yes )
                echo "Enter your desired resolution (e.g., 1920x1080):"
                read -r desired_resolution

                updateXsetupWithResolution "$desired_resolution"
                break;;
            No )
                echo "No changes made to the Xsetup file."
                break;;
            * )
                echo "Invalid option. Please select 1 for Yes or 2 for No."
                ;;
        esac
    done
}

function detectHiDPI {
    local screen_width screen_height dpi
    
    # Get current screen resolution
    screen_info=$(xrandr | grep '\*' | head -1)
    screen_width=$(echo "$screen_info" | awk '{print $1}' | cut -d'x' -f1)
    screen_height=$(echo "$screen_info" | awk '{print $1}' | cut -d'x' -f2)
    
    # Calculate approximate DPI (assuming 24-inch monitor)
    if [[ -n "$screen_width" ]] && [[ -n "$screen_height" ]]; then
        # Simple DPI calculation for common monitor sizes
        local diagonal_pixels=$(echo "sqrt($screen_width^2 + $screen_height^2)" | bc -l)
        local estimated_dpi=$(echo "$diagonal_pixels / 24" | bc -l)
        
        # Check if it's likely a HiDPI display
        if (( $(echo "$estimated_dpi > 120" | bc -l) )); then
            echo "HiDPI display detected (estimated DPI: ${estimated_dpi%.*})"
            return 0
        fi
    fi
    
    echo "Standard DPI display detected"
    return 1
}

function autoDetectResolution {
    local current_resolution
    current_resolution=$(xrandr | grep '\*' | awk '{print $1}' | head -1)
    
    if [[ -n "$current_resolution" ]]; then
        echo "Current resolution detected: $current_resolution"
        
        # Check for HiDPI
        if detectHiDPI; then
            echo "For HiDPI displays, you can either:"
            echo "1) Keep current resolution (theme will adapt)"
            echo "2) Force 1920x1080 for consistent experience"
            echo "3) Set custom resolution"
            
            select choice in "Keep current" "Force 1920x1080" "Custom resolution"; do
                case $choice in
                    "Keep current")
                        echo "Using current resolution with responsive layout"
                        break
                        ;;
                    "Force 1920x1080")
                        updateXsetupWithResolution "1920x1080"
                        break
                        ;;
                    "Custom resolution")
                        updateXsetup
                        break
                        ;;
                    *)
                        echo "Invalid choice. Please try again."
                        ;;
                esac
            done
        else
            echo "Do you want to use this resolution for SDDM? (y/n)"
            read -r response
            
            if [[ "$response" =~ ^[Yy]$ ]]; then
                updateXsetupWithResolution "$current_resolution"
            else
                updateXsetup
            fi
        fi
    else
        echo "Could not detect current resolution automatically"
        updateXsetup
    fi
}

function verifyDependencies {
    local missing_deps=()
    local required_commands=("node" "npm")
    
    for cmd in "${required_commands[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            missing_deps+=("$cmd")
        fi
    done
    
    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        echo "Error: Missing required dependencies: ${missing_deps[*]}"
        echo "Please install packages first using the appropriate function"
        return 1
    fi
    
    return 0
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

function download_from_mega {
    echo "Changing directory"
    cd "backgrounds"
    echo "Downloading videos from Mega.nz..."
    megadl 'https://mega.nz/file/AqNS0Sxa#3_E0apJ6JFmIFsGJ6_q1XXlI0klsXwsnh3QrRZhe6nI' 
    megadl 'https://mega.nz/file/tnMWiTaa#0KRYpof6fJ0cF1m85N1ZF-7AKaqDm2GaaZYWo8D3P70' 
    megadl 'https://mega.nz/file/cj8CCY6J#Ap94bhUgEocvMF9EsX_tQCnfF0hbOxA4JY3POtArLDk'
	echo "Changing Directory Back"
    cd ..
}

function download_from_dropbox {
    echo "Changing directory"
    cd "backgrounds"
    echo "Downloading videos from Dropbox..."
    curl -L 'https://www.dropbox.com/scl/fi/e6kio0zet8j5lax9ztu7y/nightbg.mp4?rlkey=29ni1jq0a9sr02b6l0s61oiiq&st=en7rqgmy&dl=0' > nightbg.mp4 
    curl -L 'https://www.dropbox.com/scl/fi/8om5p5d3ul984krbnhfgu/morningbg.mp4?rlkey=jedf5qcycj310oqx8djy9yomz&st=yupg7zz8&dl=0' > morningbg.mp4 
    curl -L 'https://www.dropbox.com/scl/fi/f3x5jfr8sk06ij3c8kgoy/sunrisebg.mp4?rlkey=r0lzylvhze4lq3xglwkvf4iya&st=ybukfsgv&dl=0' > sunrisebg.mp4
	echo "Changing Directory Back"
    cd ..
}

function choose_server {
    echo "Choose the server to download videos from:"
    echo "1) Dropbox"
    echo "2) Mega.nz"
    read -p "Enter the number (1 or 2): " server_choice

    case $server_choice in
        1)
            download_from_dropbox || {
                echo "Dropbox download failed. Trying Mega.nz as fallback..."
                download_from_mega
            }
            ;;
        2)
            download_from_mega || {
                echo "Mega.nz download failed. Trying Dropbox as fallback..."
                download_from_dropbox
            }
            ;;
        *)
            echo "Invalid choice. Defaulting to Dropbox."
            download_from_dropbox || download_from_mega
            ;;
    esac
}

function handleMultipleAccounts {
    echo "Setting up user accounts for the theme..."
    read -p "Enter the number of user accounts: " num_accounts
    
    # Validate input
    if ! [[ "$num_accounts" =~ ^[0-9]+$ ]] || [ "$num_accounts" -le 0 ]; then
        echo "Error: Please enter a valid positive number"
        return 1
    fi
    
    # Create credentials file with proper permissions
    sudo touch "components/credentials.txt"
    sudo chmod 600 "components/credentials.txt"
    > components/credentials.txt  

    for ((i = 1; i <= num_accounts; i++)); do
        echo "Setting up Account $i:"
        read -p "Enter the username: " usern
        
        # Validate username
        if [[ -z "$usern" ]] || [[ "$usern" =~ [[:space:]] ]]; then
            echo "Error: Username cannot be empty or contain spaces"
            ((i--))
            continue
        fi
        
        read -s -p "Enter the password: " passn
        echo
        
        # Hash password using sha256.js
        if [[ -f "sha256.js" ]]; then
            hashed_pass=$(node sha256.js "$passn" 2>/dev/null)
            if [[ $? -ne 0 ]] || [[ -z "$hashed_pass" ]]; then
                echo "Error: Failed to hash password"
                ((i--))
                continue
            fi
        else
            echo "Error: sha256.js not found"
            return 1
        fi
        
        echo "$usern:$hashed_pass" >> components/credentials.txt
        echo "Account $i configured successfully"
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

function skipLoadingAnimation {
  echo -e "\nDo you want to skip the login screen loading animation?"
  select sel in "Yes" "No"; do
    case $sel in
      Yes )
        echo "Loading animation will be skipped."
        if [ -f "components/LoginPanel.qml" ]; then
          rm "components/LoginPanel.qml"
        fi

        if [ -f "components/LoginPanel2.qml" ]; then
          mv "components/LoginPanel2.qml" "components/LoginPanel.qml"
        else
          echo "LoginPanel2.qml not found. Skipping rename."
        fi
        ;;
      No )
        echo "Loading animation will be displayed."
        if [ -f "components/LoginPanel2.qml" ]; then
          rm "components/LoginPanel2.qml"
        fi
        ;;
      * )
        echo "Invalid selection. Please try again."
        ;;
    esac
    break
  done
}

function safe_copy_theme {
    echo "Copying theme files to $DIR"
    
    # Create directory if it doesn't exist
    sudo mkdir -p "$DIR" || {
        echo "Error: Failed to create theme directory"
        exit 1
    }
    
    # Copy files with verification
    sudo cp -R . "$DIR" || {
        echo "Error: Failed to copy theme files"
        exit 1
    }
    
    # Set proper permissions
    sudo chmod -R 755 "$DIR" || {
        echo "Warning: Failed to set proper permissions"
    }
    
    echo "Theme files copied successfully"
}

function mainOperations {
    # Verify dependencies first
    if ! verifyDependencies; then
        echo "Installing dependencies..."
        selectOS
    fi
    
    # Detect config file
    detectConfigFile
    config_exists=$?
    
    if [[ $config_exists -ne 0 ]]; then
        echo "SDDM configuration file not found. Creating default configuration..."
        createConfig
    fi
    
    # Download videos
    choose_server
    
    # Handle resolution
    autoDetectResolution
    
    # Setup accounts
    if ! handleMultipleAccounts; then
        echo "Error setting up accounts. Continuing without custom accounts..."
    fi
    
    # Handle loading animation
    skipLoadingAnimation
    
    # Copy theme files
    safe_copy_theme
    
    # Update configuration
    changeCurrentTheme
    disableVirtualKeyboard
    
    # Test theme
    testTheme
}

displayArtAndWelcome    
mainOperations