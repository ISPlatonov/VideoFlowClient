import QtQuick 2.15
import QtQuick.Controls 2.15
import VideoFlowClient 1.0

//import "sources" as SourceList


Rectangle {
    id: mainrect
    color: Constants.backgroundColor
    width: Constants.width
    height: Constants.height

    ScrollView {
        anchors.fill: parent
        Component {
            id: delegate
            ItemDelegate {
                width: mainrect.width
                height: 70
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
                    }
                }
            }
        }


    }

    ListView {
        focus: true
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
        }
        ListElement {
            name: "boba"
            address: "https://doc.qt.io/qt-5/qtquick-modelviewsdata-modelview.html"
            cover: "covers/boba.png"
        }
    }
}
