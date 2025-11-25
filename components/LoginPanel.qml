//2
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Item {
    property var user: userPanel.username
    property var password: passwordField.text
    property var session: sessionPanel.session
    property var inputHeight: Screen.height * config.LoginScale * 0.25
    property var inputWidth: Screen.width * config.LoginScale
    readonly property real scaleFactor: (Screen.height > 0 ? Screen.height : 1080) / 1080


    Column {
        spacing: 8
        opacity: 0


        anchors {
            bottom: parent.bottom
            left: parent.left
			bottomMargin: 65 * scaleFactor
            leftMargin: 19 * scaleFactor
        }

        PowerPanel {
            id: powerPanel
        }
    }
    
        Column {
        spacing: 8
        opacity: 1


        anchors {
            top: parent.top
            right: parent.right
			topMargin: 450 * scaleFactor
            rightMargin: 19 * scaleFactor
        }

        DateTimePanel {
            id: dateTimePanel
        }
    }

    Column {
        spacing: 8
        opacity: 1
        anchors {
            top: parent.top
            left: parent.left
			topMargin: 450 * scaleFactor
            leftMargin: 19 * scaleFactor
        }

        PlayerPanel {
            id: playerPanel
        }
    }    

    Column {
        spacing: 8
		opacity: 0

        anchors {
            bottom: parent.bottom
            right: parent.right
			bottomMargin: 65 * scaleFactor
			rightMargin: 19 * scaleFactor
        }

        SessionPanel {
            id: sessionPanel
        }
    }	


    Image {
        id: basicImage
        visible: root.state === "login"
        source: "/usr/share/sddm/themes/genshin-sddm-theme/1.png" 
        width: Math.min(parent.width, sourceSize.width)
        height: sourceSize.height * (width / sourceSize.width)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top : parent.top
        anchors.topMargin: (Screen.height / 2) + 100 * scaleFactor
        z: 3

        Button {
            id: xbutton
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 15 * scaleFactor
            anchors.rightMargin: 20 * scaleFactor
            width: 30 * scaleFactor
            height: width
            onClicked: {
                root.state = "first"
                closeSound.play()
            }
            text: qsTr("X")

            background: Rectangle {
                color: "white" 
            }
            }
    	
        Text {
            anchors.top: parent.top
		    anchors.topMargin: 385 * scaleFactor
		    anchors.right: parent.right	
		    anchors.rightMargin: 350 * scaleFactor
            text: "nicefaa6waa"
            font.pixelSize: 15 * scaleFactor 
            color: "black"     
		    z:3
            }
        Text {
            anchors.top: parent.top
		    anchors.topMargin:385 * scaleFactor
		    anchors.right: parent.right 
		    anchors.rightMargin: 80 * scaleFactor
            text: "ibrahim-mammadli"
            font.pixelSize: 15 * scaleFactor 
            color: "black"   
		    z:3
            }

        Column {
            width: inputWidth + 10 * scaleFactor
            anchors.top : parent.top
            anchors.right : parent.right
            anchors.topMargin: 120 * scaleFactor
            anchors.rightMargin: 82 * scaleFactor
            visible: root.state === "login"
            spacing: 10 * scaleFactor

            UserPanel {
                id: userPanel
                height: inputHeight - 5 * scaleFactor
                width: parent.width + 10 * scaleFactor
                onActiveFocusChanged: {
                    if (activeFocus) {
                        inputFocusSound.play()  
                    }
                    }
                }

            PasswordPanel {
                id: passwordField
                opacity: 1
                height: inputHeight - 5 * scaleFactor
                width: parent.width + 20 * scaleFactor
                onActiveFocusChanged: {
                    if (activeFocus) {
                        inputFocusSound.play()  
                    }
                }
                onAccepted: loginButton.clicked()
            }

            Item {
                height: 50 * scaleFactor
                width: 1   
            }

            Button {
                id: loginButton
			    opacity:1
            
                height: inputHeight -5 * scaleFactor
                width: parent.width + 20 * scaleFactor

			

                enabled: user != "" && password != "" ? true : false
                hoverEnabled: true
                text: "Login!!"

                contentItem: Text {
                    id: buttonText

                    renderType: Text.NativeRendering
                    font.pointSize: config.GeneralFontSize
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    color: config.LoginButtonTextColor
                    opacity: 0.5
                    text: config.LoginButtonText
                }
        
                background: Rectangle {
                    id: buttonBackground
                    color: config.LoginButtonBgColor
                    opacity: 0.5
                        radius: config.CornerRadius
                    }
    
                states: [
                    State {
                        name: "pressed"
                        when: loginButton.down
                        PropertyChanges {
                            target: buttonBackground
                            color: Qt.darker(config.LoginButtonBgColor, 1.4)
                            opacity: 1
                        }
                        PropertyChanges {
                            target: buttonText
                            opacity: 1
                        }
                    },
                    State {
                        name: "hovered"
                        when: loginButton.hovered
                        PropertyChanges {
                            target: buttonBackground
                            color: Qt.darker(config.LoginButtonBgColor, 1.2)
                            opacity: 1
                        }
                        PropertyChanges {
                            target: buttonText
                            opacity: 1
                        }
                    },
                    State {
                        name: "enabled"
                        when: loginButton.enabled
                        PropertyChanges {
                            target: buttonBackground
                            opacity: 1
                        }
                        PropertyChanges {
                            target: buttonText
                            opacity: 1
                        }
                    }
                ]
    
                transitions: Transition {
                    PropertyAnimation {
                        properties: "color, opacity"
                        duration: 150
                    }
                }
    
        onClicked: { 
            loginSuccessSound.play();
            root.state = "door";
            videoPlayer2.play();
          }   
        } 
      }   
    } 
}
