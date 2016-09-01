import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Tab {
    title: "Event"

    Item {
        ColumnLayout {
            anchors {
                fill: parent
                margins: 10
            }

            Label {
                Layout.fillWidth: true

                text: "Event Name"
            }

            TextField {
                id: eventField

                Layout.fillWidth: true

                text: "BeamMeUp"
            }

            Button {
                Layout.alignment: Qt.AlignHCenter

                text: "Track Event"

                onClicked: {
                    hockeyApp.trackEvent(eventField.text);
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
