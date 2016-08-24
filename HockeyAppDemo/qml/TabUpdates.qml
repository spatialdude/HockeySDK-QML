import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Tab {
    title: "Updates"
    
    Item {
        Connections {
            target: hockeyApp

            onAvailableUpdatesChanged: {
                tableView.resizeColumnsToContents();
            }
        }

        ColumnLayout {
            anchors {
                fill: parent
                margins: 10
            }
            
            LabelField {
                label: "Current Version"
                value: hockeyApp.appVersion
            }
            
            TableView {
                id: tableView

                Layout.fillWidth: true
                Layout.fillHeight: true
                
                model: hockeyApp.availableUpdates
                
                TableViewColumn {
                    role: "title"
                    title: "Title"
                }
                
                TableViewColumn {
                    role: "version"
                    title: "Version"
                }

                TableViewColumn {
                    role: "shortversion"
                    title: "Short Version"
                }
                
                TableViewColumn {
                    role: "download_url"
                    title: "Download Url"
                }
                
                TableViewColumn {
                    role: "notes"
                    title: "Notes"
                }

                onClicked: {
                    var appInfo = model[row];
                    console.log("appInfo:", JSON.stringify(appInfo, undefined, 2));
                }
                
                onDoubleClicked: {
                    var appInfo = model[row];
                    Qt.openUrlExternally(appInfo.download_url);
                }
            }
            
            Flow {
                Layout.fillWidth: true
                
                CheckBox {
                    id: allVersionsCheckBox
                    
                    text: "Get All Versions"
                    checked: false
                }
                
                Button {
                    text: "Check for Updates"
                    
                    onClicked: {
                        hockeyApp.checkForUpdates(allVersionsCheckBox.checked);
                    }
                }
            }
        }
    }
}
