import QtQuick 2.15
import QtQuick.Controls 2.15

import "."

Item {
    id: editCamera
    anchors.fill: parent
    visible: true

    property int prop_index: parent.loader_prop_index

    property var data_model: SharedData.sharedData

    property alias prop_name: nameField.text
    property alias prop_address: addressField.text
    property alias prop_cover: imageField.text

    prop_name: SharedData.sharedData.get(prop_index).name
    prop_address: SharedData.sharedData.get(prop_index).address
    prop_cover: SharedData.sharedData.get(prop_index).cover

    signal backToCamera()

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
                placeholderText: qsTr("Путь к иконке (необязательно)")
            }
            Button {
                text: "Применить настройки"
                anchors.left: parent.left
                anchors.right: parent.right
                height: 40
                onClicked: {
                    if (prop_name !== "" && prop_address !== "") {
                        prop_cover = (prop_cover !== "") ? imageField.text : "covers/DefaultCameraImage.png"
                        SharedData.sharedData.set(prop_index, {"name": prop_name, "address": prop_address, "cover": prop_cover, "is_recording": SharedData.sharedData.get(prop_index).is_recording, "rec_id": SharedData.sharedData.get(prop_index).rec_id})
                        editCamera.backToCamera()
                    }
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
                text: "Вернуться к камере"
                anchors.fill: parent
                onClicked: {
                    editCamera.backToCamera()
                }
            }
        }
    }
}
