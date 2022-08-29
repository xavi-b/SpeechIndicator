import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl
import QtQuick.Layouts

Item {
    id: root

    property var model: []
    property color itemColor: "salmon"
    property int itemHeight: 25
    property int minimumTextWidth: 100

    clip: true

    Rectangle {
        anchors.fill: parent

        border.color: textview.activeFocus ? "#2196f3" : "#38999999"
        border.width: textview.activeFocus ? 2 : 1
    }

    Flickable {
        anchors.fill: parent
        anchors.margins: 5

        contentWidth: width
        contentHeight: flow.height

        MouseArea {
            width: parent.width
            height: flow.height < root.height ? root.height : flow.height

            onClicked: {
                textview.forceActiveFocus()
            }

            Flow {
                id: flow
                spacing: 5

                width: parent.width
                height: childrenRect.height

                Repeater {
                    model: root.model

                    Rectangle {
                        height: root.itemHeight
                        width: row.width + 10
                        color: itemColor
                        radius: 3

                        Row {
                            id: row
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height
                            spacing: 5

                            Label {
                                anchors.verticalCenter: parent.verticalCenter
                                text: modelData
                            }

                            RoundButton {
                                anchors.verticalCenter: parent.verticalCenter
                                height: parent.height / 2
                                width: height
                                text: "X"
                                onClicked: {
                                    textview.forceActiveFocus()
                                    root.model.splice(index, 1)
                                    root.modelChanged()
                                }
                            }
                        }
                    }
                }

                TextInput {
                    id: textview
                    height: root.itemHeight
                    width: contentWidth > minimumTextWidth ? contentWidth : minimumTextWidth
                    verticalAlignment: Qt.AlignVCenter

                    onAccepted: {
                        if (text != "") {
                            root.model.push(text)
                            clear()
                            root.modelChanged()
                        }
                    }

                    Keys.priority: Keys.BeforeItem
                    Keys.onPressed: {
                        if (event.key == Qt.Key_Backspace) {
                            if (text == "") {
                                root.model.splice(root.model.length - 1, 1)
                                root.modelChanged()
                            }
                        }
                    }
                }
            }
        }
    }
}
