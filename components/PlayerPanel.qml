import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12


Item {
    implicitHeight: playerButton.height
    implicitWidth: playerButton.width


    property var musicDictionary: {
    "file:///usr/share/sddm/themes/genshin-sddm-theme/sounds/snow_buried_tales.mp3": "Snow Buried Tales",
    "file:///usr/share/sddm/themes/genshin-sddm-theme/sounds/moonlike_smile.mp3" : "Moonlike Smile",
    "file:///usr/share/sddm/themes/genshin-sddm-theme/sounds/unfinished_frescoes.mp3":"Unfinished Frescoes",
    "file:///usr/share/sddm/themes/genshin-sddm-theme/sounds/the_flourishing_past.mp3":"The Flourishing Past",
    "file:///usr/share/sddm/themes/genshin-sddm-theme/sounds/finale_of_the_snowtomb.mp3":"Finale of The Snowtomb",
    "file:///usr/share/sddm/themes/genshin-sddm-theme/sounds/spin_of_the_ice_crystals.mp3":"Spin of The Ice Crystals",
    "file:///usr/share/sddm/themes/genshin-sddm-theme/sounds/glistening_shards.mp3":"Glistening Shards",
    
    }

    function currentlyPlaying() {
        var currentMusicPath = musicPlayer.source;
        return musicDictionary[currentMusicPath];
    }
    

    ListModel {
        id: playerModel

        ListElement { name: "Image" }
        ListElement { name: "Previous" }
        ListElement { name: "Next" }
    }

    Button {
        id: playerButton

        height: 40
        width: 200
        hoverEnabled: true



    background: Rectangle {
        id: playerButtonBg
        width: 200
        height: 40

        color: config.PlayerButtonColor
        radius: 40

        Row {
            spacing: 8

            Image {
                id: iconImage
                source: "../icons/play.png"
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.verticalCenterOffset: 20
            }

            Text {
                id: playerText
                anchors.verticalCenter: iconImage.verticalCenter
                anchors.left: iconImage.right 
                renderType: Text.NativeRendering
                font.pointSize: config.GeneralFontSize
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                color: config.PlayerTextColor
                text: currentlyPlaying() 
                anchors.verticalCenterOffset: -1
            }
        }
    }

        onClicked: {
            playerPopup.visible ? playerPopup.close() : playerPopup.open()
            playerButton.state = "pressed"
        }
    }

    Popup {
        id: playerPopup

        height: inputHeight * 2 + padding * 2
        x: playerButton.width + playerList.spacing + 30
        y: -height + playerButton.height - 40

        background: Rectangle {
            radius: config.CornerRadius * 4
            color: config.PopupBgColor
        }

        contentItem: ListView {
            id: playerList
            
            implicitWidth: contentWidth
            orientation: Qt.Horizontal
            clip: true

            model: playerModel
            delegate: ItemDelegate {
                id: playerEntry

                height: inputHeight * 2
                width: inputHeight * 2               
                        contentItem: Item {
            Image {
                id: playerIcon
                anchors.centerIn: parent
                source: index == 0 ? Qt.resolvedUrl("../icons/snow-buried-tales.jpg") : ""
                sourceSize: Qt.size(playerEntry.width, playerEntry.height)
            }

            

            Item {
                anchors.bottom: parent.bottom
                anchors.right: parent.right 
                width: 80
                height: 80

                Image {
                    source: index == 1 ? Qt.resolvedUrl("../icons/previous.png") :
                            index == 2 ? Qt.resolvedUrl("../icons/next.png") : ""
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

                transitions: Transition {
                    PropertyAnimation {
                        properties: "color, opacity"
                        duration: 150
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        playerPopup.close()
                        index == 0 ? sddm.suspend() : (index == 1 ? (changeSong(-1),console.log("previous song"),currentlyPlaying()) : (changeSong(1),console.log("next song"),currentlyPlaying()))
                    }
                }
            }
        }

        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        exit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }
}
