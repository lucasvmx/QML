import QtQuick 2.15

TextInput {
    id: input

    Rectangle {
        id: rectangle
        border.color: "red"
        border.width: 0.5
        height: 2
        anchors {
            top: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            rectangle.border.color = "#820ad1"
        }

        onExited: {
            rectangle.border.color = "#aa0000"
        }

        onClicked: {
            parent.focus = true
        }
    }
}
