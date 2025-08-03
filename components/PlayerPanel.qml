import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Item {
    implicitHeight: playerButton.height
    implicitWidth: playerButton.width

    property var musicDictionary: {
        "snow_buried_tales.mp3": "Snow Buried Tales",
        "moonlike_smile.mp3": "Moonlike Smile", 
        "unfinished_frescoes.mp3": "Unfinished Frescoes",
        "the_flourishing_past.mp3": "The Flourishing Past",
        "finale_of_the_snowtomb.mp3": "Finale Of The Snowtomb",
        "spin_of_the_ice_crystals.mp3": "Spin Of The Ice Crystals",
        "ballad_of_many_waters.mp3": "Ballad Of Many Waters",
        "another_hopeful_tomorrow.mp3": "Another Hopeful Tomorrow",
        "ad_oblivione.mp3": "Ad Oblivione",
        "twilight_serenity.mp3": "Twilight Serenity",
        "clear_sky_over_liyue.mp3": "Clear Sky Over Liyue",
        "blue_dream.mp3": "Blue Dream",
        "enchanting_bedtime_stories.mp3": "Enchanting Bedtime Stories",
        "glistening_shards.mp3": "Glistening Shards",
        "her_serenity.mp3": "Her Serenity"
    }

    function currentlyPlaying() {
        // Better song detection using songList array from Main.qml
        if (typeof currentSongIndex !== 'undefined' && typeof songList !== 'undefined') {
            var currentFile = songList[currentSongIndex];
            return musicDictionary[currentFile] || toTitleCase(currentFile.replace('.mp3', '').replace(/_/g, ' '));
        }
        
        // Fallback to source detection
        var currentSource = musicPlayer.source.toString();
        var filename = currentSource.substring(currentSource.lastIndexOf("/") + 1);
        filename = filename.split("?")[0].split("#")[0];
        return musicDictionary[filename] || toTitleCase(filename.replace('.mp3', '').replace(/_/g, ' '));
    }
    
    // Function to convert text to Title Case
    function toTitleCase(str) {
        return str.replace(/\w\S*/g, function(txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    }

    ListModel {
        id: playerModel
        ListElement { name: "Image" }
        ListElement { name: "Previous" }
        ListElement { name: "Pause" }
        ListElement { name: "Next" }
    }

    Button {
        id: playerButton
        height: 50
        width: 250
        hoverEnabled: true

        background: Rectangle {
            id: playerButtonBg
            width: 250
            height: 50
            color: config.PlayerButtonColor
            radius: 50

            Row {
                Image {
                    id: iconImage
                    source: "../icons/play.png"
                    width: 50
                    height: 50
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: playerText
                    renderType: Text.NativeRendering
                    font.pointSize: config.GeneralFontSize
                    font.bold: true
                    horizontalAlignment: Text.AlignLeft
                    color: config.PlayerTextColor
                    text: currentlyPlaying()
                    y: 15
                }
            }
        }

        onClicked: {
            playerPopup.visible ? playerPopup.close() : playerPopup.open()
            playerButton.state = "pressed"
            popupSound.play()
        }
    }

    Popup {
        id: playerPopup
        height: inputHeight * 1.5 + padding * 2
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
                height: inputHeight * 1.5
                width: inputHeight * 1.5
                
                contentItem: Item {
                    Image {
                        id: playerIcon
                        anchors.centerIn: parent
                        source: index == 0 ? Qt.resolvedUrl("../icons/snow-buried-tales.jpg") : ""
                        sourceSize: Qt.size(playerEntry.width * 0.8, playerEntry.height * 0.8)
                    }

                    // Smaller and centered control buttons
                    Item {
                        anchors.centerIn: parent  // Center the control buttons
                        width: 40   // Smaller overlay icons
                        height: 40
                        visible: index > 0  // Only show for control buttons

                        Image {
                            anchors.centerIn: parent  // Center within the item
                            source: index == 1 ? Qt.resolvedUrl("../icons/previous.png") :
                                    index == 2 ? Qt.resolvedUrl("../icons/pause.png") : 
                                    index == 3 ? Qt.resolvedUrl("../icons/next.png") : ""
                            width: 30   // Smaller icons
                            height: 30
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
                        index == 0 ? currentlyPlaying() : (index == 1 ? (changeSong(-1),console.log("previous song"),currentlyPlaying()) : (index == 2 ? (changeSong(0),console.log("paused song"),currentlyPlaying()) : (changeSong(1),console.log("next song"),currentlyPlaying())))
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
