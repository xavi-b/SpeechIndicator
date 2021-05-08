import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle {
    property var displayStates: [];
    property int sliderMargin: 2;
    property int currentState: 0;
    property int sliderSpeed: 500;

    height: 50
    radius: height/2
    color: "lightgray"

    property int nbDisplayStates: displayStates.length > 0 ? displayStates.length : 1

    function currentColor() {
        return displayStates[currentState].color ? displayStates[currentState].color : "transparent";
    }

    function indexName(index) {
        return displayStates[index].name ? displayStates[index].name : displayStates[index];
    }

    RectangularGlow {
        id: effect
        anchors.fill: slider
        glowRadius: sliderMargin / 2
        spread: 0.5
        color: "gray"
        cornerRadius: slider.radius + glowRadius
    }

    Rectangle {
        id: slider
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: sliderMargin
        width: parent.width / nbDisplayStates - 2 * sliderMargin
        radius: height/2
        color: "white"
        border.width: sliderMargin
        border.color: currentColor();

        x: sliderMargin + parent.width * currentState / nbDisplayStates

        Behavior on x {
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                duration: sliderSpeed
            }
        }

        Behavior on border.color {
            ColorAnimation {
                easing.type: Easing.InOutQuad
                duration: sliderSpeed
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0
        Repeater {
            model: displayStates
            Text {
                Layout.preferredWidth: parent.width / nbDisplayStates
                Layout.fillHeight: true
                text: indexName(index)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                MouseArea {
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    onClicked: {
                        currentState = index;
                    }
                }
            }
        }
    }
}
