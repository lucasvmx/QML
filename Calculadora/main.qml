import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: Qt.platform.os === "android" ? Screen.desktopAvailableWidth
                                       : 320
    height: Qt.platform.os === "android" ? Screen.desktopAvailableHeight
                                         : 480
    visible: true
    title: qsTr("Calculadora")

    MyDialog {
        id: dialog
        visible: false
        modal: true

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

        QtObject {
            id: consts
            property bool haveOperator: false
        }

        ButtonGroup {
            buttons: grid.children

            onClicked: function(button) {

                switch(button.txt)
                {
                case "x²":
                    let num = parseInt(textNumeros.text, 10);
                    textResult.text = `${num * num}`
                    break;
                case "=":
                    calculate(textNumeros.text);
                    break;

                case "\u00f7":
                case "\u00d7":
                case "-":
                case "+":
                    consts.haveOperator = true;
                    textNumeros.text += button.txt;
                    break;

                case "C":
                    textNumeros.cursorPosition = textNumeros.cursorPosition - 1;
                    textNumeros.remove(textNumeros.cursorPosition, textNumeros.cursorPosition+1)
                    break;
                case "AC":
                    textNumeros.text = "";
                    textResult.text = "";
                    break;
                default:
                    textNumeros.text += button.txt;

                    if(consts.haveOperator) {
                        // efetua o cálculo
                        calculate(textNumeros.text);
                        consts.haveOperator = false;
                    }
                }
            }

            function sanitize(data) {
                let s = String(data);

                s = s.replace(/\u00d7/g, "*");
                s = s.replace(/,/g, ".");
                s = s.replace(/\u00f7/g, "/");
                return s;
            }

            function calculate(data) {

                if(data === undefined || data.length === 0) {
                    return;
                }

                let sanitized = sanitize(data);

                try {
                    textResult.text = eval(sanitized);
                } catch(Exception) {
                    dialog.msg = "Não foi possível interpretar a expressão"
                    dialog.dialogTitle = "Erro"
                    dialog.visible = true
                    console.log("cant handle " + sanitized);
                }
            }
        }

        TextInput {
            id: textNumeros
            width: parent.width
            height: parent.height * 0.15
            font.pointSize: textNumeros.height * 0.5
            color: "blue"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: grid.anchors.leftMargin
            anchors.rightMargin: grid.anchors.rightMargin
            anchors.topMargin: 20
            cursorVisible: true
            inputMethodHints: Qt.ImhDigitsOnly
            horizontalAlignment: Qt.AlignRight
        }

        Text {
            id: textResult
            anchors.top: textNumeros.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.15;
            font.pointSize: textNumeros.height * 0.3
            horizontalAlignment: Qt.AlignRight
            color: "green"
        }

        Grid {
            id: grid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: textResult.bottom
            anchors.topMargin: 5
            anchors.leftMargin: 5
            anchors.rightMargin: 16
            height: parent.height * 0.7
            anchors.bottomMargin: 50
            columns: 4
            rows: 5
            spacing: 8

            QtObject {
                id: m
                property double v: 0.24;
                property double h: 0.20;
            }

            QtObject {
                id: colors
                property string gray: "#1e1e1e"
                property string blue: "#004fc4"
            }

            MyCalculatorButton { id: calcButton; round: true; txt:"AC"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"( )"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"%"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"\u00f7"; backgroundColor: colors.blue; width: parent.width * m.v; height: parent.height * m.h }

            MyCalculatorButton { round: true; txt:"7"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"8"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"9"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"\u00d7"; backgroundColor: colors.blue; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"4"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"5"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"6"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"-"; backgroundColor: colors.blue; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"1"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"2"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"3"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"+"; backgroundColor: colors.blue; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"0"; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:","; backgroundColor: colors.gray; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"C"; backgroundColor: colors.blue; width: parent.width * m.v; height: parent.height * m.h }
            MyCalculatorButton { round: true; txt:"="; backgroundColor: "blue"; width: parent.width * m.v; height: parent.height * m.h }
        }
    }
}
