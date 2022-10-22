import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Dialog {
    id: root
    focus: true
    anchors.centerIn: parent
    property alias msg: textContent.text
    property alias dialogTitle: textTitle.text

    background: Rectangle {
        color: "white"
    }

    contentItem: Text {
        id: textContent
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            layoutDirection: Qt.RightToLeft

            ToolButton {
                text: qsTr("X")
                onClicked: {
                    root.close()
                }
            }

            Text {
                id: textTitle
                color: "white"
            }
        }

        background: Rectangle {
            anchors.fill: parent
            color: "red"
        }
    }

    footer: DialogButtonBox {
        Button {
            id: buttonOk
            text: qsTr("OK")
            DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
        }

        background: Rectangle {
            anchors.fill: parent
            color: "red"
        }
    }
}
