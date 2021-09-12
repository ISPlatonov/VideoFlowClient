import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Example")

    property var settingsModel: [
        {
            "title": "Settings 1",
            "settings": [
                qsTr("Settings 1.1"),
                qsTr("Settings 1.2"),
                qsTr("Settings 1.3")
            ]
        },
        {
            "title": "Settings 2",
            "settings": [
                qsTr("Settings 2.1"),
                qsTr("Settings 2.2"),
                qsTr("Settings 2.3"),
                qsTr("Settings 2.4"),
                qsTr("Settings 2.5")
            ]
        },
        {
            "title": "Settings 3",
            "settings": [
                qsTr("Settings 3.1"),
                qsTr("Settings 3.2"),
                qsTr("Settings 3.3"),
            ]
        }
    ]

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: root.implicitHeight
        boundsBehavior: Flickable.OvershootBounds

        Pane {
            id: root
            anchors.fill: parent

            Column {
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                Label {
                    anchors { left: parent.left; right: parent.right }
                    topPadding: 10
                    bottomPadding: 10
                    font.pixelSize: 20
                    horizontalAlignment: Qt.AlignHCenter
                    text: qsTr("Example")
                }

                Repeater {
                    model: settingsModel
                    delegate: Column {
                        property bool showList: false
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Button {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            text: modelData.title
                            onClicked: paneSettingsList.shown = !paneSettingsList.shown
                        }
                        Pane {
                            id: paneSettingsList

                            // ## relevant part ##
                            property bool shown: false
                            visible: height > 0
                            height: shown ? implicitHeight : 0
                            Behavior on height {
                                NumberAnimation {
                                    easing.type: Easing.InOutQuad
                                }
                            }
                            clip: true
                            // ## relevant part ##

                            Material.background: "lightblue"
                            padding: 0
                            anchors.left: parent.left
                            anchors.right: parent.right
                            Column {
                                anchors.right: parent.right
                                anchors.left: parent.left

                                Repeater {
                                    id: listSettings1
                                    model: modelData.settings

                                    delegate: ItemDelegate {
                                        id: itemDelegateSettings1
                                        text: modelData
                                        padding: 0
                                        width: parent.width
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }

    }
}