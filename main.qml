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
        //onLoaded: console.log("page is loaded")
    }

    Connections {
        target: mainLoader.item
        ignoreUnknownSignals: true
        function onOpenCameraOptions(index) {
            //console.log("itemDelegate tapped, index = ", index)
            mainLoader.loader_prop_index = index
            mainLoader.source = "CameraOptions.qml"
        }
        function onBackToCameraList() {
            mainLoader.source = "CameraList.qml"
        }
        function onDeleteCamera(index) {
            mainLoader.source = "CameraList.qml"
            SharedData.sharedData.remove(mainLoader.loader_prop_index)
        }
        function onAddCamera() {
            mainLoader.source = "AddCamera.qml"
        }
        function onEditCamera() {
            mainLoader.source = "EditCamera.qml"
        }
        function onBackToCamera() {
            mainLoader.source = "CameraOptions.qml"
        }
    }
}
