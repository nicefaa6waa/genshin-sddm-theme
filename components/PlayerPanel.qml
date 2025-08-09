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
        "finale_of_the_snowtomb.mp3": "Finale Of The Snow..",
        "spin_of_the_ice_crystals.mp3": "Spin Of The Ice Cry..",
        "ballad_of_many_waters.mp3": "Ballad Of Many Wat..",
        "another_hopeful_tomorrow.mp3": "Another Hopeful To..",
        "ad_oblivione.mp3": "Ad Oblivione",
        "twilight_serenity.mp3": "Twilight Serenity",
        "clear_sky_over_liyue.mp3": "Clear Sky Over Liyue",
        "blue_dream.mp3": "Blue Dream",
        "enchanting_bedtime_stories.mp3": "Enchanting Bedti..",
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
            if (typeof popupSound !== 'undefined') popupSound.play()
        }
    }

    Popup {
        id: playerPopup
        padding: 16
        focus: true
        modal: false
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        // Expand from the button’s position (overlay it)
        x: playerButton.mapToItem(null, 0, 0).x - 26  // move popup a bit more left
        y: playerButton.mapToItem(null, 0, 0).y - 12

        property int collapsedWidth: playerButton.width + 24
        property int collapsedHeight: playerButton.height + 24
        // Narrower and a bit shorter (less growth to right/bottom)
        property int expandedWidth: Math.min(320, Math.max(300, playerButton.width + 80))
        property int expandedHeight: Math.max(220, Math.round(playerButton.height * 3.2))

        width: collapsedWidth
        height: collapsedHeight
        opacity: 0.0

        background: Rectangle {
            radius: config.CornerRadius * 4
            color: config.PopupBgColor
        }

        contentItem: Column {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 14

            // Cover + Track info (bigger)
            Row {
                spacing: 12
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 0
                anchors.rightMargin: 0

                Rectangle {
                    width: 96; height: 96; radius: 12
                    color: "transparent"
                    Image {
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectCrop
                        source: Qt.resolvedUrl("../icons/snow-buried-tales.jpg")
                    }
                }

                Column {
                    spacing: 6
                    width: Math.max(160, parent.width - 96 - 28)
                    Text {
                        text: currentlyPlaying()
                        elide: Text.ElideRight
                        horizontalAlignment: Text.AlignLeft
                        color: config.PlayerTextColor
                        renderType: Text.NativeRendering
                        font.pointSize: Math.max(14, (config.GeneralFontSize || 12) * 1.3)
                        font.bold: true
                    }
                    Text {
                        text: "Now Playing"
                        color: config.PlayerIconColor
                        renderType: Text.NativeRendering
                        font.pointSize: Math.max(11, (config.GeneralFontSize || 12) * 0.95)
                        opacity: 0.85
                    }
                }
            }

            // Controls (no Qt.createQmlObject; bigger buttons)
            Row {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 24   // indent controls slightly to the right
                anchors.rightMargin: 0
                spacing: 22

                Button {
                    width: 64; height: 64; hoverEnabled: true
                    background: Rectangle { radius: 32; color: "transparent" }
                    contentItem: Image {
                        anchors.centerIn: parent
                        source: Qt.resolvedUrl("../icons/previous.png")
                        width: 38; height: 38; fillMode: Image.PreserveAspectFit
                    }
                    onClicked: { changeSong(-1); console.log("previous song") }
                }

                Button {
                    width: 72; height: 72; hoverEnabled: true
                    background: Rectangle { radius: 36; color: "transparent" }
                    contentItem: Image {
                        anchors.centerIn: parent
                        // If you expose isPaused here, you can swap icons dynamically
                        source: Qt.resolvedUrl("../icons/pause.png")
                        width: 44; height: 44; fillMode: Image.PreserveAspectFit
                    }
                    onClicked: { changeSong(0); console.log("toggle pause") }
                }

                Button {
                    width: 64; height: 64; hoverEnabled: true
                    background: Rectangle { radius: 32; color: "transparent" }
                    contentItem: Image {
                        anchors.centerIn: parent
                        source: Qt.resolvedUrl("../icons/next.png")
                        width: 38; height: 38; fillMode: Image.PreserveAspectFit
                    }
                    onClicked: { changeSong(1); console.log("next song") }
                }
            }
        }

        // Expand/collapse animations
        onOpened: { animIn.start() }
        onClosed: {
            width = collapsedWidth
            height = collapsedHeight
            opacity = 0.0
        }

        SequentialAnimation {
            id: animIn
            PropertyAnimation { target: playerPopup; property: "opacity"; from: 0.0; to: 1.0; duration: 100; easing.type: Easing.OutQuad }
            ParallelAnimation {
                PropertyAnimation { target: playerPopup; property: "width"; from: playerPopup.collapsedWidth; to: playerPopup.expandedWidth; duration: 160; easing.type: Easing.OutCubic }
                PropertyAnimation { target: playerPopup; property: "height"; from: playerPopup.collapsedHeight; to: playerPopup.expandedHeight; duration: 180; easing.type: Easing.OutCubic }
            }
        }
    }
}
