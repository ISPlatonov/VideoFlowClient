import QtQuick 2.15
import QtQuick.Controls 2.15

import "."

Item {
    id: cameraOptions
    anchors.fill: parent
    visible: true

    property int prop_index: parent.loader_prop_index

    property var data_model: SharedData.sharedData

    property string prop_name: data_model.get(prop_index).name
    property string prop_address: data_model.get(prop_index).address
    property string prop_cover: data_model.get(prop_index).cover
    property bool prop_status: data_model.get(prop_index).is_recording

    signal backToCameraList()
    signal deleteCamera(int prop_index)

    ScrollView {
        anchors.fill: parent
        visible: true
        contentWidth: availableWidth

        Column {
            anchors.fill: parent
            visible: true
            anchors.margins: 40
            spacing: 10

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 128
                height: 128
                source: prop_cover
                smooth: true
            }
            Text {
                //color: Constants.font.color
                text: prop_name
                font.pointSize: 20
                width: parent.width
                clip: true
            }
            Text {
                //color: Constants.font.color
                text: prop_address
                font.pointSize: 12
                width: parent.width
                clip: true
                //wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }
            Text {
                text: "STATUS: " + (prop_status ? "RECORDING" : "STILL")
                color: (prop_status ? "red" : "blue")
                width: parent.width
                clip: true
            }
            Button {
                height: 80
                anchors.left: parent.left
                anchors.right: parent.right
                text: (prop_status ? "Закончить" : "Начать") + " запись"
                onClicked: {
                    data_model.setProperty(prop_index, "is_recording", !prop_status)
                }
            }
            Button {
                height: 80
                anchors.left: parent.left
                anchors.right: parent.right
                text: "Настроить камеру"
                onClicked: {
                    // open EditCamera.qml
                }
            }
            Button {
                height: 80
                anchors.left: parent.left
                anchors.right: parent.right
                text: "Удалить камеру"
                onClicked: {
                    cameraOptions.deleteCamera(prop_index)
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
            text: "Вернуться к списку камер"
            anchors.fill: parent
            onClicked: {
                cameraOptions.backToCameraList()
            }
        }
    }
}
