import QtQuick 2.12
import QtQuick.Controls 2.12

import "."


Item {
    id: cameraList
    anchors.fill: parent
    visible: true

    signal openCameraOptions(int index)
    signal addCamera()

    ScrollView {
        //visible: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: footer.top
        anchors.margins: 20
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        clip: true
        ListView {
            implicitHeight: childrenRect.height
            implicitWidth: childrenRect.width
            //focus: true
            id: mainList
            //anchors.fill: parent
            model: SharedData.sharedData //Data.source
            delegate: ItemDelegate {
                id: itemDelegate
                width: mainrect.width
                height: 100

                property string prop_name: name
                property string prop_address: address
                property bool prop_status: is_recording
                property int prop_index: index
                onClicked: cameraList.openCameraOptions(prop_index)

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    //anchors.verticalCenter: parent.verticalCenter
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        width: 64
                        height: 64
                        source: cover
                        smooth: true
                    }
                    Column {
                        Text {
                            text: prop_name
                            font.pointSize: 20
                        }
                        Text {
                            text: prop_address
                            font.pointSize: 12
                        }
                        Text {
                            text: "STATUS: " + (prop_status ? "RECORDING" : "STILL")
                            color: (prop_status ? "red" : "blue")
                        }
                    }
                }
            }
        }
    }

    Row {
        id: footer
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        //anchors.top: mainList.bottom
        spacing: 5
        height: 70
        Button {
            //id: addCamera
            text: "Добавить камеру"
            width: parent.width / 2
            height: parent.height
            //anchors.fill: parent
            onClicked: cameraList.addCamera()
        }
        Button {
            //id: addCamera
            text: "Добавить камеру"
            width: parent.width / 2
            height: parent.height
            //anchors.fill: parent
            onClicked: cameraList.recordAllCameras()
        }
    }
}

