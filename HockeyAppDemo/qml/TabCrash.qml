import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Tab {
    title: "Crash"
    
    Item {
        ColumnLayout {
            anchors {
                fill: parent
                margins: 10
            }

            Label {
                Layout.fillWidth: true

                text: "Description"
            }

            TextArea {
                id: descriptionText

                Layout.fillWidth: true
                Layout.fillHeight: true

                text: "Crash report " + (new Date()).toString()
            }

            Label {
                Layout.fillWidth: true

                text: "Crash log"
            }

            TextArea {
                id: logText
                
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                text: "Crash log " + (new Date()).toString()
            }
            
            Button {
                Layout.alignment: Qt.AlignHCenter

                text: "Report Crash"

                onClicked: {
                    hockeyApp.reportCrash(logText.text, descriptionText.text);
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: "#80000000"
            }

            Flow {
                Layout.fillWidth: true
                
                Button {
                    text: "Exception 1"
                    
                    onClicked: {
                        try {
                            g = 100;
                        } catch (e) {
                            hockeyApp.reportError(e, text);
                        }
                    }
                }
                
                Button {
                    text: "Exception 2"
                    
                    onClicked: {
                        try {
                            var a = 0;
                            var b = 1;
                            var c = b / freddo;
                        } catch (e) {
                            hockeyApp.reportError(e, text);
                        }
                    }
                }
                
                Button {
                    text: "Custom Exception"
                    
                    onClicked: {
                        try {
                            throw new Error("Something bad happened");
                        } catch (e) {
                            hockeyApp.reportError(e, text);
                        }
                    }
                }
            }
        }
    }
}
