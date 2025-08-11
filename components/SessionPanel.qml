import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12

Item {
    property var session: 0  // Initialize with default value
    property bool menuOpen: false
    property string currentSessionName: "GNOME"  // Add this property to track current name
    
    // Add scaling factors for different screen sizes
    property real scaleFactor: Math.min(parent.width / 1920, parent.height / 1080)

    implicitHeight: sessionButton.height
    implicitWidth: sessionButton.width
    
    // Function to update session name
    function updateSessionName() {
        try {
            if (sessionModel && session >= 0 && session < sessionModel.rowCount()) {
                var index = sessionModel.index(session, 0);
                if (index.valid) {
                    var sessionName = sessionModel.data(index, Qt.DisplayRole);
                    if (sessionName && sessionName.toString().length > 0) {
                        currentSessionName = sessionName.toString();
                        return;
                    }
                }
            }
        } catch (e) {
            console.log("Session name error:", e);
        }
        
        // Fallback to common session names
        var commonSessions = ["GNOME", "KDE Plasma", "XFCE", "i3", "Sway", "Hyprland"];
        if (session >= 0 && session < commonSessions.length) {
            currentSessionName = commonSessions[session];
        } else {
            currentSessionName = "Desktop";
        }
    }
    
    // Update session name when session changes
    onSessionChanged: {
        updateSessionName();
    }
    
    Component.onCompleted: {
        updateSessionName();
    }

    // Helper to keep source image aspect ratio (letterboxed, centered)
    Component {
        id: aspectImage
        Item {
            id: aspectRoot
            property alias source: img.source
            property bool smooth: true
            property bool async: true
            Image {
                id: img
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                smooth: aspectRoot.smooth
                asynchronous: aspectRoot.async
            }
        }
    }

    // Custom session button using sessionselect.png
    Button {
        id: sessionButtonAlt
        
        // Center horizontally and move down slightly
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height * 0.40  // Moved down more
        
        // Reduce height while maintaining aspect ratio
        property real aspectRatio: 4.0  // Keep width-to-height ratio
        property real targetWidth: Math.min(300, parent.width * 0.20)
        
        width: targetWidth
        height: (width / aspectRatio) * 0.8  // Make 20% shorter
        
        hoverEnabled: true
        z: 1  // Base level for session button
        
        background: Rectangle {
            radius: config.CornerRadius * 2
            color: "transparent"
            border.width: 0
            anchors.fill: parent

            Image {
                anchors.fill: parent
                anchors.margins: 6 * scaleFactor
                source: Qt.resolvedUrl("../backgrounds/session/sessionselect.png")
                onStatusChanged: if (status === Image.Error)
                    source = Qt.resolvedUrl("../backgrounds/sesspn/sessionselect.png")
                fillMode: Image.PreserveAspectFit
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                smooth: true
                asynchronous: true
            }
        }
        
        // If you show current session icon/text inside:
        contentItem: Row {
            spacing: 8 * scaleFactor
            anchors.fill: parent
            anchors.margins: 10 * scaleFactor
            
            // Current session icon (keeps aspect)
            Loader {
                width: 28 * scaleFactor
                height: 28 * scaleFactor
                sourceComponent: aspectImage
                onLoaded: {
                    // Keep your existing icon source here if you have one
                    // item.source = someIconPath
                }
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: currentSessionName  // Use the property that gets updated
                font.family: config.Font || "Arial"
                font.pointSize: Math.max(10, (config.GeneralFontSize || 12))
                font.bold: true
                color: config.SessionTextColor || "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        
        onClicked: {
            // Close 1.png if it's open
            if (root.state === "login") {
                root.state = "first"
            }
            
            menuOpen = !menuOpen
            sessionMenu.visible = menuOpen
            if (menuOpen && typeof popupSound !== 'undefined') {
                popupSound.play()
            }
        }
    }
    
    // Custom session selection menu
    Item {
        id: sessionMenu
        objectName: "sessionMenu"
        visible: false
        
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -50
        
        // Make popup 1.5x larger (not 2x)
        property real aspectRatio: 1.25
        property real targetHeight: Math.min(600, parent.height * 0.50)
        
        width: targetHeight * aspectRatio
        height: targetHeight
        z: 50
        
        // Background menu image
        Image {
            id: menuBackground
            anchors.fill: parent
            source: Qt.resolvedUrl("../backgrounds/session/selectionmenu.png")
            fillMode: Image.Stretch
            
            // X button - moved and made invisible
            Button {
                id: closeButton
                
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 22  // Move down 2px (was 20)
                anchors.rightMargin: 22  // Move left 2px (was 20)
                
                width: 40
                height: 40
                
                visible: false  // Make invisible but keep functional
                
                background: Rectangle {
                    color: "transparent"  // Make completely transparent
                    radius: width / 2
                }
                
                contentItem: Text {
                    text: "X"
                    font.bold: true
                    color: "transparent"  // Make text transparent too
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                
                onClicked: {
                    menuOpen = false
                    sessionMenu.visible = false
                    if (typeof closeSound !== 'undefined') {
                        closeSound.play()
                    }
                }
            }
            
            // Add a MouseArea only for the X button area (invisible but functional)
            MouseArea {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 22
                anchors.rightMargin: 22
                width: 40
                height: 40
                onClicked: {
                    menuOpen = false
                    sessionMenu.visible = false
                    if (typeof closeSound !== 'undefined') {
                        closeSound.play()
                    }
                }
            }
            
            // Scrollable session list with small top border
            ScrollView {
                id: sessionScrollView
                
                anchors.fill: parent
                anchors.topMargin: 100
                anchors.bottomMargin: 60
                anchors.leftMargin: 40
                anchors.rightMargin: 40
                
                clip: true
                
                ListView {
                    id: sessionList
                    
                    model: sessionModel
                    currentIndex: sessionModel.lastIndex
                    spacing: 6
                    
                    Component.onCompleted: {
                        if (sessionModel) {
                            currentIndex = sessionModel.lastIndex;
                            session = currentIndex;  // Initialize session property
                            updateSessionName();
                        }
                    }
                    
                    // Update when model is swapped/refreshed (avoid invalid signal warnings)
                    onModelChanged: {
                        try {
                            if (sessionModel && typeof sessionModel.lastIndex !== "undefined") {
                                currentIndex = sessionModel.lastIndex
                                session = currentIndex
                                updateSessionName()
                            }
                        } catch (e) {
                            // ignore
                        }
                    }
                    
                    delegate: Item {
                        id: sessionDelegate
                        
                        width: sessionList.width
                        height: 48
                        
                        property bool isSelected: sessionList.currentIndex === index
                        property bool isHovered: sessionMouseArea.containsMouse
                        
                        // Session option background image
                        Image {
                            id: sessionOptionBg
                            anchors.fill: parent
                            source: {
                                if (isSelected) {
                                    return Qt.resolvedUrl("../backgrounds/session/chselected.png")
                                } else if (isHovered) {
                                    return Qt.resolvedUrl("../backgrounds/session/chhovered.png")
                                } else {
                                    return Qt.resolvedUrl("../backgrounds/session/chempty.png")
                                }
                            }
                            fillMode: Image.Stretch
                            
                            // Session name text
                            Text {
                                anchors.centerIn: parent
                                text: model.name || "Unknown Session"
                                font.family: config.Font || "Arial"
                                font.pointSize: Math.max(7, (config.GeneralFontSize || 12) * 0.7)
                                font.bold: isSelected
                                color: {
                                    if (isSelected) {
                                        return config.SessionSelectedTextColor || "#FFD700"
                                    } else if (isHovered) {
                                        return config.SessionHoveredTextColor || "#FFFFFF"
                                    } else {
                                        return config.SessionNormalTextColor || "#CCCCCC"
                                    }
                                }
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        
                        MouseArea {
                            id: sessionMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            
                            onClicked: {
                                sessionList.currentIndex = index
                                session = index  // Update the session property
                                
                                // Update session name directly from the model data
                                try {
                                    if (sessionModel && index >= 0) {
                                        var modelIndex = sessionModel.index(index, 0);
                                        if (modelIndex.valid) {
                                            var sessionName = sessionModel.data(modelIndex, Qt.DisplayRole);
                                            if (sessionName && sessionName.toString().length > 0) {
                                                currentSessionName = sessionName.toString();
                                            } else {
                                                // Use the actual model name from delegate
                                                currentSessionName = model.name || "Unknown Session";
                                            }
                                        }
                                    }
                                } catch (e) {
                                    // Fallback to model name from delegate
                                    currentSessionName = model.name || "Unknown Session";
                                }
                                
                                menuOpen = false
                                sessionMenu.visible = false
                                
                                // Play selection sound
                                if (typeof inputFocusSound !== 'undefined') {
                                    inputFocusSound.play()
                                }
                            }
                        }
                        
                        // Smooth transitions
                        Behavior on opacity {
                            NumberAnimation {
                                duration: 150
                                easing.type: Easing.InOutQuad
                            }
                        }
                    }
                }
                
                // Custom scrollbar styling
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AsNeeded
                    
                    background: Rectangle {
                        color: "transparent"
                        implicitWidth: 12
                        radius: width / 2
                    }
                    
                    contentItem: Rectangle {
                        color: config.ScrollBarColor || "#80FFFFFF"
                        radius: width / 2
                        implicitWidth: 8
                        
                        opacity: parent.policy === ScrollBar.AlwaysOn || 
                                (parent.active && parent.size < 1.0) ? 0.75 : 0
                        
                        Behavior on opacity {
                            NumberAnimation { duration: 150 }
                        }
                    }
                }
            }
        }
        
        // Menu entrance animation
        NumberAnimation {
            id: menuEnterAnimation
            target: sessionMenu
            property: "scale"
            from: 0.8
            to: 1.0
            duration: 200
            easing.type: Easing.OutBack
        }
        
        // Menu exit animation
        NumberAnimation {
            id: menuExitAnimation
            target: sessionMenu
            property: "scale"
            from: 1.0
            to: 0.8
            duration: 150
            easing.type: Easing.InBack
            onStopped: sessionMenu.visible = false
        }
        
        onVisibleChanged: {
            if (visible) {
                menuEnterAnimation.start()
            }
        }
    }
    
    // Centralized, file-relative icon path (repo: backgrounds/session/sessionselect.png)
    property url sessionIcon: Qt.resolvedUrl("../backgrounds/session/sessionselect.png")

    // Session button (icon keeps aspect ratio)
    Button {
        id: sessionButton
        text: ""                      // no default label

        // Center horizontally and move down slightly
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height * 0.40  // Moved down more

        // Reduce height while maintaining aspect ratio
        property real aspectRatio: 4.0  // Keep width-to-height ratio
        property real targetWidth: Math.min(300, parent.width * 0.20)

        width: targetWidth
        height: (width / aspectRatio) * 0.8  // Make 20% shorter

        hoverEnabled: true
        z: 1  // Base level for session button

        background: Rectangle {
            radius: config.CornerRadius * 2
            color: "transparent"
            border.width: 0
            anchors.fill: parent

            Image {
                anchors.fill: parent
                anchors.margins: 6 * scaleFactor
                source: Qt.resolvedUrl("../backgrounds/session/sessionselect.png")
                onStatusChanged: if (status === Image.Error)
                    source = Qt.resolvedUrl("../backgrounds/sesspn/sessionselect.png")
                fillMode: Image.PreserveAspectFit
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                smooth: true
                asynchronous: true
            }

            // Centered name only (moved slightly higher)
            Text {
                id: sessionNameLabel
                text: currentSessionName
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 18 * scaleFactor
                width: parent.width - 16 * scaleFactor
                horizontalAlignment: Text.AlignHCenter
                elide: Text.ElideRight
                color: config.DateColor
                renderType: Text.NativeRendering
                font.pointSize: Math.max(12, baseFontSize)
                font.bold: true
            }
        }

        onClicked: {
            // Close 1.png if it's open
            if (root.state === "login") {
                root.state = "first"
            }

            menuOpen = !menuOpen
            sessionMenu.visible = menuOpen
            if (menuOpen && typeof popupSound !== 'undefined') {
                popupSound.play()
            }
        }
    }

    // Transparent scrim that sits under the popup and eats outside clicks
    Rectangle {
        id: sessionPopupScrim
        anchors.fill: parent
        visible: sessionPopup.visible
        color: "transparent"
        z: 998
        MouseArea {
            anchors.fill: parent
            onClicked: sessionPopup.close()   // close only when clicking outside
        }
    }

    // The popup itself; do NOT auto-close on inside clicks
    Popup {
        id: sessionPopup
        modal: true
        focus: true
        padding: 0
        z: 999
        // Only ESC should close automatically. Outside clicks handled by the scrim above.
        closePolicy: Popup.CloseOnEscape

        background: Rectangle {
            radius: config.CornerRadius * 3
            color: config.PopupBgColor
        }

        contentItem: Item {
            id: popupRoot
            anchors.fill: parent

            // Main image (clicking here should NOT close)
            Image {
                id: sessionPreview
                anchors.fill: parent
                anchors.margins: 10 * scaleFactor
                source: Qt.resolvedUrl("../backgrounds/session/sessionselect.png")
                onStatusChanged: if (status === Image.Error)
                    source = Qt.resolvedUrl("../backgrounds/sesspn/sessionselect.png")
                fillMode: Image.PreserveAspectFit
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                smooth: true
                asynchronous: true
            }

            // Optional: centered name inside popup as well
            Text {
                id: popupSessionName
                text: currentSessionName
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20 * scaleFactor    // higher than before
                width: parent.width - 20 * scaleFactor
                horizontalAlignment: Text.AlignHCenter
                elide: Text.ElideRight
                color: config.DateColor
                renderType: Text.NativeRendering
                font.pointSize: Math.max(12, baseFontSize)
                font.bold: true
            }

            // Close button (X)
            Button {
                id: closeBtn
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 8 * scaleFactor
                width: Math.max(28, 28 * scaleFactor)
                height: width
                background: Rectangle { radius: height / 2; color: "transparent" }
                contentItem: Text {
                    anchors.centerIn: parent
                    text: "✕"
                    color: config.PlayerTextColor
                    font.pointSize: Math.max(10, 10 * scaleFactor)
                    renderType: Text.NativeRendering
                }
                onClicked: sessionPopup.close()
            }
        }
    } // end sessionPopup
} // end of root Item

