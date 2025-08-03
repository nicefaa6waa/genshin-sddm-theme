import QtQuick 2.12
import QtQuick.Controls 2.12

Column {
    spacing: 0
    
    Text {
        id: dateLabel

        anchors.right: parent.right
        opacity: config.DateOpacity

        renderType: Text.NativeRendering
        font.pointSize: config.DateSize * 1.2  // Make bigger
        font.bold: config.DateIsBold == "true" ? true : false
        color: config.DateColor
                
        function updateDate() {
            text = new Date().toLocaleDateString(Qt.locale(), config.DateFormat)
        }
    }

    Text {
        id: timeLabel

        anchors.right: parent.right
        opacity: config.TimeOpacity

        renderType: Text.NativeRendering
        font.pointSize: config.TimeSize * 1.2  // Make bigger
        font.bold: config.TimeIsBold == "true" ? true : false
        color: config.TimeColor

        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(), config.TimeFormat)
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            timeLabel.updateTime()
            dateLabel.updateDate()
        }
    }

    Component.onCompleted: {
        timeLabel.updateTime()
        dateLabel.updateDate()
    }
}
