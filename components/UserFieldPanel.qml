import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

TextField {
    id: usernameField

    height: inputHeight
    width: inputWidth
    selectByMouse: true
    echoMode: TextInput.Normal
    selectionColor: config.TextFieldTextColor

    renderType: Text.NativeRendering
    font.pointSize: config.GeneralFontSize
    font.bold: true
    color: config.TextFieldTextColor
    horizontalAlignment: Text.AlignHCenter

    placeholderText: "Username"
    text: userModel.lastUser

    background: Rectangle {
        id: userFieldBackground

        color: "transparent"
        border.color: "gray"
        border.width: 2
        radius: config.CornerRadius
    }

    states: [
        State {
            name: "focused"
            when: usernameField.activeFocus
            PropertyChanges {
                target: userFieldBackground
                border.color: "white"
            }
        },
        State {
            name: "hovered"
            when: usernameField.hovered
            PropertyChanges {
                target: userFieldBackground
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

