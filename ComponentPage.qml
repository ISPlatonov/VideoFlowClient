import QtQuick 2.15
import QtQuick.Controls 2.15
import VideoFlowClient 1.0


Item {
    id: componentPage
    width: Constants.width
    height: Constants.height
    //anchors.fill: parent

    //anchors.verticalCenter: parent.verticalCenter
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
