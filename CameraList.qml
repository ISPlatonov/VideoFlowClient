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
                // cameraOptionsPane
                Pane {
                    id: cameraOptionsPane
                    property bool shown: false
                    visible: height > 0
                    height: shown ? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation {
                            easing.type: Easing.InOutQuad
                        }
                    }
                    clip: true
                    padding: 0
                    anchors.top: parent.top
                    anchors.right: parent.right
                    //anchors.left: parent.left
                    //anchors.fill: parent

                    Row {
                        //height: parent.height
                        anchors.fill: parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            text: is_recording ? "save rec." : "start rec."
                            onClicked: {is_recording = !is_recording; console.log("---\nis rec.: ", is_recording, "\nsource list index: ", prop_index, "\n---")}
                        }
                        Button {
                            text: "change props"
                            onClicked: {}
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
    }
}

