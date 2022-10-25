import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    height: textSenha.height * 1.5
    flat: true
    width: parent.width * 0.6
    property alias buttonText: contentText.text

    background: Rectangle {
        id: backgroundRect
        border.color: "#820ad1"
        border.width: 1
        radius: 5
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

    }

    contentItem: Text {
        id: contentText
        text: "CONTINUAR"
        color: "#820ad1"
        width: parent.width
        height: parent.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            backgroundRect.color = "#820ad1"
            contentText.color = "white"
        }

        onExited: {
            backgroundRect.color = "white"
            contentText.color = "#820ad1"
        }

        onClicked: {
            parent.clicked()
        }
    }
}
