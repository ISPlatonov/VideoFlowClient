import QtQuick 2.15
import QtQuick.Controls 2.15

import "."

//import "CameraList.qml" as CameraList

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

    Loader {
        id: mainLoader
        visible: true
        source: "CameraList.qml"
        anchors.fill: parent
        property int loader_prop_index
        signal getIndex(int index)
        onLoaded: console.log("page is loaded")
    }

    Connections {
        target: mainLoader.item
        function onOpenCameraOptions(index) {
            console.log("itemDelegate tapped, index = ", index)
            mainLoader.source = "CameraOptions.qml"
            mainLoader.loader_prop_index = index
            mainLoader.getIndex(mainLoader.loader_prop_index)
            //mainLoader.children.prop_index = mainLoader.loader_prop_index
            //console.log(mainLoader.children.prop_index)
        }
    }
}
