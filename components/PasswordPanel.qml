import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: passwordField

    focus: true
    selectByMouse: true
    placeholderText: "Password"
    echoMode: TextInput.Password
    passwordCharacter: "•"
    passwordMaskDelay: 1000
    selectionColor: config.TextFieldTextColor
    
    renderType: Text.NativeRendering
    font.pointSize: config.GeneralFontSize
    font.bold: true
    color: config.TextFieldTextColor
    horizontalAlignment: TextInput.AlignHCenter
    
    background: Rectangle {
        id: passFieldBg

        color: "transparent"
        border.color: "gray"
        border.width: 2
        radius: config.CornerRadius
    }

    states: [
        State {
            name: "focused"
            when: passwordField.activeFocus
            PropertyChanges {
                target: passFieldBg
                border.color: "white"
            }
        },
        State {
            name: "hovered"
            when: passwordField.hovered
            PropertyChanges {
                target: passFieldBg
                border.color: "lightgray"
            }
        }
    ]

    transitions: Transition {
        PropertyAnimation {
            properties: "color, border.width"
            duration: 150
        }
    }
}
