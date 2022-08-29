import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

TextField {
    id: root

    property var model: []
    property color itemColor: "salmon"
    property int minimumTextWidth: 100

    leftPadding: listview.width + 10

    onAccepted: {
        root.model.push(text)
        clear()
        root.modelChanged()
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

    ListView {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5

        id: listview
        contentWidth: contentItem.childrenRect.width
        width: contentWidth > (root.width - minimumTextWidth) ? (root.width - minimumTextWidth) : contentWidth
        clip: true
        height: parent.height - 10
        spacing: 5
        orientation: Qt.Horizontal

        model: root.model

        delegate: Rectangle {
            height: listview.height
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
                        root.forceActiveFocus()
                        root.model.splice(index, 1)
                        root.modelChanged()
                    }
                }
            }
        }
    }
}
