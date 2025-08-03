import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQml.Models 2.12

Column {
    property var username: usernameField.text

    spacing: 0  // Remove extra spacing

    UserFieldPanel {
        id: usernameField
        height: inputHeight
        width: parent.width  // Use parent width instead of inputWidth +30
    }
}
