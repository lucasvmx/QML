/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    anchors.fill: parent

    color: "#820ad1"

    Dialog {
        id: dlg
        standardButtons: Dialog.Ok
        anchors.centerIn: parent
    }

    Rectangle {
        color: "white"
        radius: 10

        anchors {
            fill: parent
            topMargin: 20
            bottomMargin: 20
            leftMargin: 20
            rightMargin: 20
        }

        Text {
            id: textHeader
            text: "Faça seu login"
            font.pixelSize: 24
            font.bold: true
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: parent.height * 0.1
        }

        Label {
            id: labelCpf
            text: "CPF"
            color: "#820ad1"
            font.pointSize: 14
            width: parent.width * 0.6
            anchors {
                left: textCpf.left
                top: textHeader.bottom
                topMargin: parent.height * 0.1
                horizontalCenter: parent.horizontalCenter
            }
        }

        NuTextInput {
            id: textCpf
            width: parent.width * 0.6
            height: labelSenha.font.pointSize * 1.5
            anchors.top: labelCpf.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: labelCpf.font.pointSize - 4
        }

        Label {
            id: labelSenha
            text: "Senha"
            color: "#820ad1"
            font.pointSize: 14
            width: parent.width * 0.6

            anchors {
                left: textCpf.left
                top: textCpf.bottom
                topMargin: parent.height * 0.1
                horizontalCenter: parent.horizontalCenter
            }
        }

        NuTextInput {
            id: textSenha
            width: parent.width * 0.6
            height: labelSenha.font.pointSize * 1.5
            anchors.top: labelSenha.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            echoMode: TextInput.Password

        }

        NuButton {
            id: buttonContinue
            buttonText: qsTr("CONTINUAR")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textSenha.bottom
            anchors.topMargin: parent.height * 0.1

            onClicked: {
                dlg.title = "Você fez login"
                dlg.visible = true
            }
        }

        Label {
            id: labelEsqueceuSenha
            text: "Esqueci minha senha >"
            color: "#820ad1"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: buttonContinue.bottom
            anchors.topMargin: buttonContinue.height

            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onClicked: {
                    dlg.title = "Esqueceu a sua senha!!!"
                    dlg.visible = true
                }
                onEntered: function() {
                    labelEsqueceuSenha.color = "green"
                }
                onExited: function() {
                    labelEsqueceuSenha.color = "#820ad1"
                }
            }
        }

        Label {
            id: labelCadastrar
            text: "Ainda não sou cliente >"
            color: "#820ad1"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: labelEsqueceuSenha.bottom
            anchors.topMargin: labelEsqueceuSenha.height / 2
            anchors.bottom: parent.bottom

            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onClicked: {
                    dlg.title = "Você ainda não é cliente"
                    dlg.visible = true
                }
                onEntered: function() {
                    labelCadastrar.color = "green"
                }
                onExited: function() {
                    labelCadastrar.color = "#820ad1"
                }
            }
        }
    }
}
