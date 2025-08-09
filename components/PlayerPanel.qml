import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Item {
    implicitHeight: playerButton.height
    implicitWidth: playerButton.width
    // Reusable scrolling label with middle-ellipsis + auto-scroll
    Item {
        id: MarqueeLabelPrototype
        // Use with: MarqueeLabel { text: "..." }
        default property alias data: container.data
        property alias text: fullText.text
        property color color: config.PlayerTextColor
        property real pointSize: Math.max(14, (config.GeneralFontSize || 12) * 1.3)
        property bool bold: true
        property int loopDelay: 1500
        property int backDelay: 500
        property int scrollDuration: Math.min(9000, Math.max(2500, (fullText.contentWidth - clip.width) * 35))
        width: parent ? parent.width : 200
        height: fullText.implicitHeight
        visible: false // this is just a prototype container
        Item { id: container }
    }

    // Actual component type to instantiate
    Component {
        id: MarqueeLabel
        Item {
            id: marquee
            property alias text: fullText.text
            property color color: config.PlayerTextColor
            property real pointSize: Math.max(14, (config.GeneralFontSize || 12) * 1.3)
            property bool bold: true
            property int loopDelay: 1500
            property int backDelay: 500
            property int scrollDuration: Math.min(9000, Math.max(2500, (fullText.contentWidth - clip.width) * 35))
            width: parent ? parent.width : 200
            height: fullText.implicitHeight

            Item {
                id: clip
                anchors.fill: parent
                clip: true

                // Static middle-ellipsis
                Text {
                    id: elidedText
                    anchors.fill: parent
                    text: fullText.text
                    elide: Text.ElideMiddle
                    color: marquee.color
                    renderType: Text.NativeRendering
                    font.pointSize: marquee.pointSize
                    font.bold: marquee.bold
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    opacity: 1.0
                }

                // Full text that scrolls within the clip
                Text {
                    id: fullText
                    x: 0
                    anchors.verticalCenter: parent.verticalCenter
                    color: marquee.color
                    renderType: Text.NativeRendering
                    font.pointSize: marquee.pointSize
                    font.bold: marquee.bold
                    opacity: 0.0
                }
            }

            readonly property bool needsScroll: fullText.contentWidth > clip.width + 2

            SequentialAnimation {
                id: scrollAnim
                running: marquee.visible && marquee.needsScroll
                loops: Animation.Infinite
                PauseAnimation { duration: marquee.loopDelay }
                ParallelAnimation {
                    NumberAnimation { target: elidedText; property: "opacity"; to: 0.0; duration: 200; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: fullText; property: "opacity"; to: 1.0; duration: 200; easing.type: Easing.InOutQuad }
                }
                NumberAnimation {
                    target: fullText; property: "x"
                    from: 0
                    to: -(fullText.contentWidth - clip.width)
                    duration: marquee.scrollDuration
                    easing.type: Easing.InOutQuad
                }
                PauseAnimation { duration: marquee.backDelay }
                NumberAnimation {
                    target: fullText; property: "x"
                    to: 0
                    duration: marquee.scrollDuration
                    easing.type: Easing.InOutQuad
                }
                ParallelAnimation {
                    NumberAnimation { target: fullText; property: "opacity"; to: 0.0; duration: 200; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: elidedText; property: "opacity"; to: 1.0; duration: 200; easing.type: Easing.InOutQuad }
                }
            }

            onWidthChanged: scrollAnim.running = visible && needsScroll
            onVisibleChanged: scrollAnim.running = visible && needsScroll
            Component.onCompleted: {
                // Make this instance visible; prototype stays hidden
                visible = true
                scrollAnim.running = visible && needsScroll
            }
        }
    }

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
                    MarqueeLabel {
                        id: titleLabel
                        width: parent.width
                        text: currentlyPlaying()
                        color: config.PlayerTextColor
                        pointSize: Math.max(14, (config.GeneralFontSize || 12) * 1.3)
                        bold: true
                        // Optional tuning:
                        // loopDelay: 1200
                        // backDelay: 400
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
