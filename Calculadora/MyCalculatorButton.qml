import QtQuick
import QtQuick.Controls 2.15

Button {
    property alias backgroundColor: background.color
    property alias radius: background.radius
    property alias txt: buttonText.text
    property bool round: false

    flat: true

    background: Rectangle {
        id: background

        anchors.fill: parent
        color: "blue"
        radius: (round) ? background.width / 2 : 0
        implicitWidth: 100
        implicitHeight: 100
    }

    contentItem: Text {
        id: buttonText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.pointSize: 18
    }
}
