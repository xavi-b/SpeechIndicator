import net.xavib.speechindicator 1.0
import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    width: 300
    height: 200
    color: "lightgray"

    Timer {
        repeat: true
        running: true
        interval: 100
        onTriggered: {
            speechIndicator.power = Math.random() * 100;
            speechWaveIndicator.power = Math.random() * 100;
        }
    }

    RowLayout {
        anchors.fill: parent

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
}
