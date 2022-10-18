import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Calculadora")

    Dialog {
        id: dialog
        title: "Title"
        standardButtons: Dialog.Ok
        visible: false
        anchors.centerIn: parent
        modal: true
        font.pointSize: 12

        Timer {
            id: timer
            interval: 3000
            onTriggered: {
                dialog.close()
            }
        }

        onVisibleChanged: {
            if(dialog.visible) {
                timer.start()
            }
        }
    }


    Rectangle {
        id: frame
        color: "black"
        anchors.fill: parent

        ButtonGroup {
            buttons: grid.children

            onClicked: function(button) {
                if(button.txt === "=") {
                    calculate(textNumeros.text);
                } else if(button.txt === "C") {
                    textNumeros.text = "";
                } else {
                    textNumeros.text += button.txt;
                }
            }

            function calculate(data) {

                if(data === undefined || data.length === 0) {
                    return;
                }

                data = data.replace("\u00d7", "*");
                data = data.replace(",", ".");

                try {
                    textNumeros.text = eval(data);
                } catch(Exception) {
                    dialog.title = "Expressão incorreta"
                    dialog.visible = true
                }
            }
        }

        TextInput {
            id: textNumeros
            anchors.top: parent.top
            width: parent.width
            height: parent.height * 0.3
            font.pixelSize: textNumeros.height * 0.2
            color: "blue"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: grid.anchors.leftMargin
            anchors.rightMargin: grid.anchors.rightMargin
            cursorVisible: true

            Rectangle {
                border.color: "blue"
                border.width: 0.5
                height: 2
                focus: false
                anchors {
                    top: parent.bottom
                    left: parent.left
                    right: parent.right
                }
            }
        }

        Grid {
            id: grid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: textNumeros.bottom
            anchors.topMargin: 5
            anchors.leftMargin: 5
            anchors.rightMargin: 8
            height: parent.height * 0.8
            columns: 4
            rows: 4
            spacing: 8

            QtObject {
                id: m
                property double v: 0.24;
                property double h: 0.20;
            }

            MyCalculatorButton { txt:"7"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"8"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"9"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"\u00d7"; backgroundColor: "orange"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"4"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"5"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"6"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"-"; backgroundColor: "orange"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"1"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"2"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"3"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"+"; backgroundColor: "orange"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"0"; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:","; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"C"; backgroundColor: "orange"; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { txt:"="; backgroundColor: "green"; width: parent.width * m.v; height: parent.height * m.h }
        }
    }
}
