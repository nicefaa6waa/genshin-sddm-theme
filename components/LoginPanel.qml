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
	property var users: {
       "default": "genshinsddmtheme",
       "user2": "password2",
	}
	

    function checkCredentialsAndRunActions(username, password) {
        if (users.hasOwnProperty(username) && users[username] === password) {
            return true; 
        }
			   			   
                                                               }
    Column {
        spacing: 8
		opacity: 0

        anchors {
            bottom: parent.bottom
            left: parent.left
			bottomMargin: 65
            leftMargin: 19
        }

        PowerPanel {
            id: powerPanel
        }
    }
    Column {
        spacing: 8
		opacity: 0

        anchors {
            bottom: parent.bottom
            right: parent.right
			bottomMargin: 65
			rightMargin: 19
        }

        SessionPanel {
            id: sessionPanel
        }
    }	


    Column {
        spacing: 10
        width: inputWidth + 10
        anchors.centerIn: parent
	

    
        UserPanel {
            id: userPanel
        }

        PasswordPanel {
            id: passwordField
			opacity:1

            height: inputHeight -5
            width: parent.width + 20
			anchors.top: parent.top
			anchors.topMargin: 130
			anchors.right: parent.right
			anchors.rightMargin: -12

            onAccepted: loginButton.clicked()
        }

        Button {
            id: loginButton
			opacity:1
            
            height: inputHeight -5
            width: parent.width + 20
			anchors.right: parent.right
			anchors.rightMargin: -10
			anchors.top: parent.top
			anchors.topMargin: 245
			

            enabled: user != "" && password != "" ? true : false
            hoverEnabled: true
            text: "Login!!"

            contentItem: Text {
                id: buttonText

                renderType: Text.NativeRendering
                font.family: config.Font
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
        if (users.hasOwnProperty(user) && users[user] === password) {
                        root.state = "door1";
			videoOutput2.visible = true;
			videoPlayer2.play();
				videoPlayer2.onStopped.connect(function () {
					videoOutput3.visible = true;
                                        videoPlayer3.play()
						videoPlayer3.onStopped.connect(function () {
							mainbg.visible = true;
							sddm.login(user, password, session);
                   });
                });
        } else {
            passwordField.text = "";
        }
    }
  }
 }
}
