import net.xavib.xbqmlplugin 1.0
import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    width: 300
    height: 200
    color: "white"

    Timer {
        repeat: true
        running: true
        interval: 100
        onTriggered: {
            speechIndicator.power = Math.random() * 100;
            speechWaveIndicator.power = Math.random() * 100;
        }
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            SpeechIndicator {
                id: speechIndicator
                power: 100
                color: "blue"
                Layout.fillWidth: true
                Layout.fillHeight: true

                Behavior on power {
                    PropertyAnimation {
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            SpeechWaveIndicator {
                id: speechWaveIndicator
                power: 100
                color: "salmon"
                Layout.preferredWidth: parent.width * 2 / 3
                Layout.fillHeight: true

    //            Behavior on power {
    //                PropertyAnimation {
    //                    easing.type: Easing.InOutQuad
    //                }
    //            }
            }
        }

        StateSelector {
            Layout.fillWidth: true
            Layout.margins: 4

            textColor: "green"
            textFont.family: "Arial"
            textFont.bold: true
            textFont.italic: true
            sliderSpeed: 1000;
            sliderColor: "salmon"

            displayStates: [
                {
                    name: "aaa",
                    color: "red"
                },
                {
                    name: "bbb",
                    color: "transparent"
                },
                {
                    name: "ccc",
                    color: "yellow"
                }
            ]
        }
    }
}
