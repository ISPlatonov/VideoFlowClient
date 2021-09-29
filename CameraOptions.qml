import QtQuick 2.15
import QtQuick.Controls 2.15

import "."

Item {
    id: cameraOptions
    anchors.fill: parent
    visible: true

    property int prop_index: parent.loader_prop_index

    property var data_model: SharedData.sharedData

    property string prop_name: SharedData.sharedData.get(prop_index).name
    property string prop_address: data_model.get(prop_index).address
    property string prop_cover: data_model.get(prop_index).cover
    property bool prop_status: data_model.get(prop_index).is_recording
    property var prop_rec_id: data_model.get(prop_index).rec_id

    signal backToCameraList()
    signal deleteCamera(int prop_index)
    signal editCamera()

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
                    var index = prop_index
                    if (prop_status === false) {
                        // start rec.
                        let request = new XMLHttpRequest()
                        request.open("POST", "http://localhost:5000/rec/start", true);
                        request.setRequestHeader("Content-Type", "application/json");
                        request.onreadystatechange = function() {
                            if (request.readyState === XMLHttpRequest.DONE) {
                                if (request.status && request.status === 200) {
                                    let json_data = JSON.parse(request.responseText);
                                    SharedData.sharedData.setProperty(index, "rec_id", parseInt(json_data.id));
                                    console.log("response:", SharedData.sharedData.get(index).rec_id);
                                    //var result = JSON.parse(request.responseText)
                                    //for (var i in result)
                                }
                            }
                        }
                        let data = JSON.stringify({"address": prop_address})
                        request.send(data);
                        SharedData.sharedData.setProperty(prop_index, "is_recording", !prop_status)
                    }
                else {
                        // stop rec.
                        let request = new XMLHttpRequest()
                        request.open("POST", "http://localhost:5000/rec/stop", true);
                        request.setRequestHeader("Content-Type", "application/json");
                        request.onreadystatechange = function() {
                            if (request.readyState === XMLHttpRequest.DONE) {
                                if (request.status && request.status === 200) {
                                    let json_data = JSON.parse(request.responseText);
                                    //data_model.setProperty(prop_index, "rec_id", json_data.video_address);
                                    console.log("response:", json_data.video_address);
                                    //var result = JSON.parse(request.responseText)
                                    //for (var i in result)
                                }
                            }
                        }
                        let data = JSON.stringify({"id": prop_rec_id})
                        request.send(data);
                        SharedData.sharedData.setProperty(index, "is_recording", !prop_status)
                    }
                }
            }
            Button {
                height: 80
                anchors.left: parent.left
                anchors.right: parent.right
                text: "Настроить камеру"
                enabled: !prop_status
                onClicked: {
                    cameraOptions.editCamera()
                }
            }
            Button {
                height: 80
                anchors.left: parent.left
                anchors.right: parent.right
                text: "Удалить камеру"
                enabled: !prop_status
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
