import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3
import org.julialang 1.0

ApplicationWindow {
    title: qsTr("Hash Calculator")
    width: 840; height: 480
    minimumWidth: 840; minimumHeight: 480
    color: "#2a2e32"
    visible: true
    MouseArea {
        anchors.fill: parent
        onClicked: forceActiveFocus()
    }
    Column {
        width: parent.width*0.9; height: parent.height*0.9
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 30
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            TextField {
                id: textField
                placeholderText: qsTr("Please select a file...")
                Layout.fillWidth: true
            }
            Button {
                text: qsTr("Open")
                onClicked: fileDialog.open();
            }
        }
        ColumnLayout {
        width: parent.width*0.9; height: parent.height*0.9-80
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: qsTr("SHA1: ")
            }
            TextField {
                id: sha1
                readOnly: true
                onFocusChanged: if(focus) selectAll()
                Layout.fillWidth: true
            }
        }
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: qsTr("SHA2-256: ")
            }
            TextField {
                id: sha2_256
                readOnly: true
                onFocusChanged: if(focus) selectAll()
                Layout.fillWidth: true
            }
        }
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: qsTr("SHA2-384: ")
            }
            TextField {
                id: sha2_384
                readOnly: true
                onFocusChanged: if(focus) selectAll()
                Layout.fillWidth: true
            }
        }
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: qsTr("SHA2-512: ")
            }
            TextField {
                id: sha2_512
                readOnly: true
                onFocusChanged: if(focus) selectAll()
                Layout.fillWidth: true
            }
        }
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: qsTr("SHA3-256: ")
            }
            TextField {
                id: sha3_256
                readOnly: true
                onFocusChanged: if(focus) selectAll()
                Layout.fillWidth: true
            }
        }
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: qsTr("SHA3-384: ")
            }
            TextField {
                id: sha3_384
                readOnly: true
                onFocusChanged: if(focus) selectAll()
                Layout.fillWidth: true
            }
        }
        RowLayout {
            width: parent.width*0.9; height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: qsTr("SHA3-512: ")
            }
            TextField {
                id: sha3_512
                readOnly: true
                onFocusChanged: if(focus) selectAll()
                Layout.fillWidth: true
            }
        }
        }
        Button {
            width: parent.width*0.9; height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Run")
            onClicked: {
                if (textField.text == "") return
                sha1.text = Julia.calcSha1(textField.text)
                sha2_256.text = Julia.calcSha2_256(textField.text)
                sha2_384.text = Julia.calcSha2_384(textField.text)
                sha2_512.text = Julia.calcSha2_512(textField.text)
                sha3_256.text = Julia.calcSha3_256(textField.text)
                sha3_384.text = Julia.calcSha3_384(textField.text)
                sha3_512.text = Julia.calcSha3_512(textField.text)
            }
        }
    }
    FileDialog {
        id: fileDialog
        title: "Open File"
        folder: shortcuts.home
        onAccepted: textField.text = fileDialog.fileUrl
    }
}
