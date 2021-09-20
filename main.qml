import QtQuick 2.15
import QtQuick.Controls 2.15

import "."


ApplicationWindow {
    id: mainrect
    //color: Constants.backgroundColor
    width: 480
    height: 640
    visible: true
    title: qsTr("VideoCamera addresses")

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
            //console.log("itemDelegate tapped, index = ", index)
            mainLoader.source = "CameraOptions.qml"
            mainLoader.loader_prop_index = index
            mainLoader.getIndex(mainLoader.loader_prop_index)
            //mainLoader.children.prop_index = mainLoader.loader_prop_index
            //console.log(mainLoader.children.prop_index)
        }
        function onBackToCameraList() {
            mainLoader.source = "CameraList.qml"
        }
    }
}
