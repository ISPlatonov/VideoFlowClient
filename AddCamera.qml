import QtQuick 2.15
import QtQuick.Controls 2.15

import "."

Item {
    id: addCamera
    anchors.fill: parent
    visible: true

    property var data_model: SharedData.sharedData

    property string prop_name
    property string prop_address
    property string prop_cover

    signal backToCameraList()

    ScrollView {
        anchors.fill: parent
        visible: true
        contentWidth: availableWidth

        Column {
            anchors.fill: parent
            visible: true
            anchors.margins: 40
            spacing: 10

            TextField {
                id: nameField
                anchors.left: parent.left
                anchors.right: parent.right
                height: 40
                placeholderText: qsTr("Название")
            }
            TextField {
                id: addressField
                anchors.left: parent.left
                anchors.right: parent.right
                height: 40
                placeholderText: qsTr("Адрес")
            }
            TextField {
                id: imageField
                anchors.left: parent.left
                anchors.right: parent.right
                height: 40
                placeholderText: qsTr("Путь к иконке")
            }
            Button {
                text: "Добавить камеру"
                anchors.left: parent.left
                anchors.right: parent.right
                height: 40
                onClicked: {
                    //
                }
            }
        }
        Item {
            id: footer
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            //anchors.top: mainList.bottom
            height: 70
            Button {
                text: "Вернуться к списку камер"
                anchors.fill: parent
                onClicked: {
                    addCamera.backToCameraList()
                }
            }
        }
    }
}
