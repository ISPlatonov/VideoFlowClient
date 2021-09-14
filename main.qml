import QtQuick 2.15
import QtQuick.Controls 2.15

/*ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Scroll")

    ScrollView {
        anchors.fill: parent

        ListView {
            id: listView
            width: parent.width
            model: 20
            delegate: ItemDelegate {
                text: "Item " + (index + 1)
                width: listView.width
            }
        }
    }
}*/


ApplicationWindow {
    id: mainrect
    //color: Constants.backgroundColor
    width: 480
    height: 640
    visible: true
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

    ScrollView {
        visible: true
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
                            font.pointSize: 20
                        }
                        Text {
                            //color: Constants.font.color
                            text: address
                            font.pointSize: 12
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

    ListView {
        focus: true
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
