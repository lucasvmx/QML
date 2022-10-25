import QtQuick 2.15

Window {
    id: window
    visible: true
    width: Qt.platform.os === "android" ? Screen.desktopAvailableWidth
                                       : 320
    height: Qt.platform.os === "android" ? Screen.desktopAvailableHeight
                                         : 480

    NubankLogin {
        id: loginScreen
    }

    onActiveChanged: {
        if(window.active) {
            loginScreen.visible = true
        }
    }
}
