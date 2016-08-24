import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Tab {
    title: "App"
    
    Item {
        ColumnLayout {
            anchors {
                fill: parent
                margins: 10
            }
            
            LabelField {
                label: "App ID"
                value: hockeyApp.appId
            }
            
            LabelField {
                label: "Package Id"
                value: hockeyApp.appPackageId
            }
            
            LabelField {
                label: "Version"
                value: hockeyApp.appVersion
            }

            LabelField {
                label: "Token"
                value: hockeyApp.token
            }
            
            LabelField {
                label: "Session Id"
                value: hockeyApp.sessionId
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            
            Button {
                Layout.alignment: Qt.AlignHCenter
                
                text: "Start New Session"
                
                onClicked: {
                    hockeyApp.startSession(true);
                }
            }
        }
    }
}
