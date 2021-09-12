import QtQuick 2.15
import QtQuick.Controls 2.15
import VideoFlowClient 1.0
//import "ComponentPage.qml"

//import "sources" as SourceList


ApplicationWindow {
    id: mainrect
    color: Constants.backgroundColor
    width: Constants.width
    height: Constants.height
    title: qsTr("VideoCamera addresses")

    /*Item {
        id: componentPage
        width: parent.width
        height: parent.height
        anchors.fill: parent

        anchors.verticalCenter: parent.verticalCenter
        Image {
            width: 64
            height: 64
            source: cover
            smooth: true
        }
        Column {
            Text {
                //color: Constants.font.color
                text: name
                font.pointSize: Constants.largeFont.pixelSize
            }
            Text {
                //color: Constants.font.color
                text: address
                font.pointSize: Constants.font.pixelSize
            }
        }
    }*/

    /*StackView {
        id: stackView
        initialItem: mainList
        anchors.fill: parent
    }*/

    /*Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: mainList.height
        boundsBehavior: Flickable.OvershootBounds*/
        ScrollView {
            //visible: true
            anchors.fill: parent
            Component {
                id: delegate
                /*Loader {
                    id: pageLoader
                }*/

                ItemDelegate {
                    width: mainrect.width
                    height: 70

                    //onClicked: stackView.push(componentPage)

                    TapHandler {
                        onTapped: cameraOptionsPane.shown = !cameraOptionsPane.shown
                    }


                    Row {
                        anchors.verticalCenter: parent.verticalCenter
                        Image {
                            width: 64
                            height: 64
                            source: cover
                            smooth: true
                        }
                        Column {
                            Text {
                                //color: Constants.font.color
                                text: name
                                font.pointSize: Constants.largeFont.pixelSize
                            }
                            Text {
                                //color: Constants.font.color
                                text: address
                                font.pointSize: Constants.font.pixelSize
                            }
                            Text {
                                text: "STATUS: " + (is_recording ? "RECORDING" : "STILL")
                                color: (is_recording ? "red" : "blue")
                            }
                        }
                    }



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
                                TapHandler {
                                    onTapped: {is_recording = !is_recording; console.log("is rec.: ", is_recording)}
                                }
                            }
                            Button {
                                text: "change props"
                                TapHandler {
                                    //onTapped:
                                }
                            }
                        }
                    }
                }
            }
        }


    //}

    ListView {
        //focus: true
        /*
        header: Rectangle {
            width: parent.width
            height: 30
            gradient: Gradient {
                GradientStop {position: 0; color: Constants.backgroundColor}
                GradientStop {position: 0.7; color: "black"}
            }
            Text {
                anchors.centerIn: parent
                color: Constants.backgroundColor
                text: "VideoCamera addresses"
                font.bold: true
                font.pointSize: Constants.largeFont.pixelSize
            }
        }
        footer: Rectangle {
            width: parent.width
            height: 30
            gradient: Gradient {
                GradientStop {position: 0; color: Constants.backgroundColor}
                GradientStop {position: 0.7; color: "black"}
            }
        }
        */

        id: mainList
        anchors.fill: parent
        model: source
        delegate: delegate
    }

    // data
    ListModel {
        id: source

        ListElement {
            name: "biba"
            address: "https://track.miem.hse.ru/project/ps/us/136"
            cover: "covers/biba.png"
            is_recording: false
        }
        ListElement {
            name: "boba"
            address: "https://doc.qt.io/qt-5/qtquick-modelviewsdata-modelview.html"
            cover: "covers/boba.png"
            is_recording: false
        }
    }
}
