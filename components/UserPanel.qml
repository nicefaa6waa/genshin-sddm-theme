import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQml.Models 2.12

Column {
    property var username: usernameField.text

    spacing: 30

    DelegateModel {
        id: userWrapper

        model: userModel
        delegate: ItemDelegate {
            id: userEntry
                
            height: inputHeight
            width: parent.width
            highlighted: userList.currentIndex == index

            contentItem: Text {
                renderType: Text.NativeRendering
                font.family: config.Font
                font.pointSize: config.GeneralFontSize
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: highlighted ? config.PopupBgColor : config.PopupHighlightColor
                text: name
            }

            background: Rectangle {
                id: userEntryBg

                color: highlighted ? config.PopupHighlightColor : config.PopupBgColor
                radius: config.CornerRadius
            }

            states: [
                State {
                    name: "hovered"
                    when: userEntry.hovered
                    PropertyChanges {
                        target: userEntryBg
                        color: highlighted ? Qt.darker(config.PopupHighlightColor, 1.2) : Qt.darker(config.PopupBgColor, 1.2)
                    }
                }
            ]

            transitions: Transition {
                PropertyAnimation {
                    property: "color"
                    duration: 150
                }
            }


        }
    }

    Popup {
        id: userPopup

        width: inputWidth
        y: (inputWidth / 3) - padding - (userList.implicitHeight / 2)
        padding: 15

        background: Rectangle {
            radius: config.CornerRadius * 1.8
            color: config.PopupBgColor
        }

        contentItem: ListView {
            id: userList

            implicitHeight: contentHeight
            spacing: 8
            model: userWrapper
            currentIndex: userModel.lastIndex
            clip: true
        }

        enter: Transition {
            NumberAnimation {
                properties: "opacity"
                from: 0
                to: 1
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        exit: Transition {
            NumberAnimation {
                properties: "opacity"
                from: 1
                to: 0
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }


UserFieldPanel {
    id: usernameField
    height: inputHeight
    width: inputWidth +30

    anchors {
        right: parent.right
        rightMargin: -425
        bottom: parent.bottom
        bottomMargin: -125
    }
}
}
