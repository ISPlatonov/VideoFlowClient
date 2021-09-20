import QtQuick 2.15
import QtQuick.Controls 2.15

import "."


Item {
    id: cameraList
    anchors.fill: parent
    visible: true

    signal openCameraOptions(int index)

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
                            //color: Constants.font.color
                            text: prop_name
                            font.pointSize: 20
                        }
                        Text {
                            //color: Constants.font.color
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

    Item {
        id: footer
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        //anchors.top: mainList.bottom
        height: 70
        Button {
            id: addCamera
            text: "Добавить камеру"
            anchors.fill: parent
            onClicked: console.log("add new camera pressed")
        }
        /*Row {
            anchors.fill: parent
            Button {
                id: addCamera
                text: "Добавить камеру"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: console.log("add new camera pressed")
            }
            Button {
                id: deleteCamera
                text: "Удалить камеру"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: console.log("delete a camera pressed")
            }
        }*/


    }
}

