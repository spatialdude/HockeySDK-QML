import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

Window {
    width: 450
    height: 450
    visible: true

    //--------------------------------------------------------------------------

    Component.onCompleted: {
        if (!(hockeyApp.appVersion > "")) {
            hockeyApp.appVersion = "1.0.0";
        }

        hockeyApp.startSession();
    }

    //--------------------------------------------------------------------------

    HockeyApp {
        id: hockeyApp

        userName: userField.value
        userEmail: emailField.value

        appId: lookupProperty("appId")
        appPackageId: lookupProperty("packageId", "com.myapp.demo");

        token: "<Insert API token here>"

        property var appProperties: {
            "ios": {
                "appId": "<Insert iOS App ID here>"
            },
            "osx": {
                "appId": "<Insert OSX App ID here>"
            },
            "windows": {
                "appId": "<Insert Windows App ID here>"
            },
            "winphone": {
                "appId": "<Insert Windows Phone App ID here>"
            },
            "winrt": {
                "appId": "<Insert Windows RT App ID here>"
            },
            "android": {
                "appId": "<Insert Android App ID here>"
            },
            "linux": {
                "appId": "<Insert Linux App ID here>"
            },
            "unix": {
                "appId": "<Insert Unix App ID here>"
            }
        }

        function lookupProperty(name, defaultValue) {
            return (appProperties[os] || {})[name] || (defaultValue || "");
        }
    }

    //--------------------------------------------------------------------------

    ColumnLayout {
        anchors {
            fill: parent
            margins: 5
        }

        spacing: 10

        Text {
            Layout.fillWidth: true

            text: "HockeyApp Demo"
            font.pointSize: 24
            color: "black"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter
        }

        LabelField {
            label: "SDK Version"
            value: hockeyApp.sdkVersion
        }

        LabelField {
            id: userField

            label: "User Name"
            value: "Roger Ramjet"
            readOnly: false
        }

        LabelField {
            id: emailField

            label: "User Email"
            value: "roger.ramjet@hero.world.gov"
            readOnly: false
        }

        TabView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            TabApp {
            }

            TabDevice {
            }

            TabCrash {
            }

            TabFeedback {
            }

            TabUpdates {
            }
        }
    }
}

