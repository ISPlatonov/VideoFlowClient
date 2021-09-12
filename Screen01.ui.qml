import QtQuick 2.15
import QtQuick.Controls 2.15
import VideoFlowClient 1.0

Rectangle {
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Text {
        text: qsTr("Hello VideoFlowClient")
        anchors.centerIn: parent
        font.family: Constants.font.family
    }
}
