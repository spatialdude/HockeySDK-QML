import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Tab {
    title: "Feedback"
    
    Item {
        ColumnLayout {
            anchors {
                fill: parent
                margins: 10
            }
            
            Label {
                Layout.fillWidth: true

                text: "Subject"
            }

            TextField {
                id: subjectField
                
                Layout.fillWidth: true

                text: "User feedback about version %1".arg(hockeyApp.appVersion)
            }
            
            Label {
                Layout.fillWidth: true

                text: "Description"
            }

            TextArea {
                id: feedback
                
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                text: "I think version %1 is pretty cool".arg(hockeyApp.appVersion)
            }
            
            Button {
                Layout.alignment: Qt.AlignHCenter
                
                text: "Send Feedback"
                
                onClicked: {
                    hockeyApp.sendFeedback(feedback.text, {
                                               subject: subjectField.text
                                           });
                }
            }
        }
    }
}
