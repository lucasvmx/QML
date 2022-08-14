/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import NubankLogin

Rectangle {
    width: 400
    height: 700
    font.family: "Roboto"

    color: "#820ad1"

    Rectangle {
        color: "white"
        radius: 10
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            topMargin: 20
            bottomMargin: 20 * 4
            leftMargin: 20
            rightMargin: 20
        }

        Text {
            text: "Faça seu login"
            font.pixelSize: 24
            font.bold: true
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 60
            }
        }

        Label {
            id: labelCpf
            text: "CPF"
            color: "#820ad1"
            font.pixelSize: 20
            width: parent.width * 0.6
            anchors {
                left: textCpf.left
                top: parent.top
                topMargin: 160
                horizontalCenter: parent.horizontalCenter
            }
        }

        TextInput {
            id: textCpf
            width: parent.width * 0.6
            height: 25

            anchors {
                top: labelCpf.bottom
                horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                border.color: "red"
                border.width: 0.5
                height: 2
                anchors {
                    top: parent.bottom
                    left: parent.left
                    right: parent.right
                }
            }
        }

        Label {
            id: labelSenha
            text: "Senha"
            color: "#820ad1"
            font.pixelSize: 20
            width: parent.width * 0.6

            anchors {
                left: textCpf.left
                top: parent.top
                topMargin: 260
                horizontalCenter: parent.horizontalCenter
            }
        }

        TextInput {
            id: textSenha
            width: parent.width * 0.6
            height: 25

            anchors {
                top: labelSenha.bottom
                horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                border.color: "red"
                border.width: 0.5
                height: 2
                anchors {
                    top: parent.bottom
                    left: parent.left
                    right: parent.right
                }
            }
        }

        Button {
            id: buttonContinue
            height: textSenha.height * 1.5
            flat: true
            width: parent.width * 0.6

            anchors {
                top: textSenha.bottom
                topMargin: 60

                horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                color: parent.color
                border.color: "#820ad1"
                border.width: 1
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

            }

            contentItem: Text {
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
        }

        Label {
            id: labelEsqueceuSenha
            text: "Esqueci minha senha >"
            color: "#820ad1"

            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 70
            }
        }

        Label {
            id: labelCadastrar
            text: "Ainda não sou cliente >"
            color: "#820ad1"
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 40
            }
        }
    }
}
