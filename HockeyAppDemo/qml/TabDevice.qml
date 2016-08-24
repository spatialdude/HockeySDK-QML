import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Tab {
    title: "Device"
    
    Item {
        ColumnLayout {
            anchors {
                fill: parent
                margins: 10
            }
            
            LabelField {
                label: "OS"
                value: hockeyApp.osName
            }

            LabelField {
                label: "Language"
                value: hockeyApp.deviceLanguage
            }

            LabelField {
                label: "Device ID"
                value: hockeyApp.deviceId
            }

            LabelField {
                label: "Manufacturer"
                value: hockeyApp.deviceManufacturer
            }
            
            LabelField {
                label: "Model"
                value: hockeyApp.deviceModel
            }
            
            LabelField {
                label: "Device Type"
                value: hockeyApp.deviceType
            }
            
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
