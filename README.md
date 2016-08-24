
HockeySDK for QML
=========

An *unofficial* QML SDK for [HockeyApp](http://www.hockeyapp.net) .

This SDK has been designed to be lightweight and very easy to integrate into virtually any [QML based Qt application](http://doc.qt.io/qt-5/qmlapplications.html) on almost any [platform supported by Qt](http://doc.qt.io/qt-5/supported-platforms.html).

There are currently no user interface components in the SDK.
Being QML coders, you know how *Quick* and easy it is to build great looking user interfaces with QML.

## Features

* Crash reporting
* Feedback
* Usage metrics
* Check for updates

## Getting Started

* Copy the **HockeyApp.qml** component file to your application's source folder.
* Declare an instance of the **HockeyApp** component in your application's QML code
* Initialize the **HockeyApp** instance's properties with your app's identifier and other values as needed.

e.g.

```qml
import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    HockeyApp {
        id: hockeyApp

        appId: "<MYAPPID>"
        packageId: "com.myapp.demo"
        userName: "Roger Ramjet"
        userEmail: "roger.ramjet@hero.gov.world"
    }

    Component.onCompleted {
        hockeyApp.startSession();
    }
}
```

### HockeyAppDemo

The **HockeyAppDemo** app shows the basics of how to use the **HockeyApp** component.

To try the demo -

* [Create](https://support.hockeyapp.net/kb/app-management-2/how-to-create-a-new-app) one or more apps on https://hockeyapp.net
* Modify **HockeyAppDemo.qml**, adding the app id(s) and other property values as required.
* Open **HockeyAppDemo.qmlproject** in Qt Creator to run the demo using **qmlscene**
* Open **HockeyAppDemo.pro** in Qt Creator to compile into executables using any Qt kits you have installed.

The demo also shows a way to configure the **HockeyApp** component with multiple app ids. This is so the demo can be compiled for any platform from a single source.

## Documentation

The SDK is pretty easy to use and figure out, just take a look at **HockeyAppDemo** and you should be up and running very *Quick*ly.

Following are some notes to help you get going and complement the demo.

#### Commonly Used Properties

| Property Name | Type | Required | Default Value | Description |
|---|---|---|---|---|
| appId | string | Yes | | [HockeyApp app id](https://support.hockeyapp.net/kb/app-management-2/how-to-find-the-app-id) |
| appVersion | string | No | Qt.application.version | The version is expected to be in the [conventional](http://doc.qt.io/qt-5/qversionnumber.html) Qt ```<major>.<minor>.<micro>``` format. e.g. **2.1.7** |
| deviceId | string | No | Random UUID | This property can be used to unqiuely identify the device the app is running on. Since there is no out-of-the-box way in QML to get a unique device id, a random one is generated for each instance of the **HockeyApp** component. It is recommended that your app generates and persists is a unqiue device identifier (e.g. [QUuid](http://doc.qt.io/qt-5/quuid.html)) and assigns it to this property. |
| packageId | string | Yes | | Bundle/package id |
| token | string | No | | A token is required if your app is checking for updates or sending feedback. A recommended simple approach is to use a read-only [api token]( https://rink.hockeyapp.net/manage/auth_tokens) .
| userEmail | string | No | | User's email address |
| userName | string | No | | User name/id |

There are a bunch of other properties yet to be documented.
The **HockeyApp** component is designed to be used with minimal fuss, so many propeties are initialized with values derived from the QML environment. You can always override the default property values with your own.


#### Usage metrics

* Call the **startSession()** function at the point in you application the designates the start of a session. For example in the app's root QML component's **Component.onCompleted** signal handler.
* The **userName** property should be set before calling **startSession()** to gather *User* metrics.

#### Crash Reporting

* Two functions are provided for reporting crashes in an app.

##### Generic crash reports

* **reportCrash(log, description)**

    * *log* - A string of log text or an array of log strings
    * *description* - An optional description of the crash

e.g.

```javascript
hockeyApp.reportCrash("Network error 42", "Sending customer details");
```


##### JavaScript exception reports

* **reportError(error, description)**

    * *error* - A JavaScript **Error** object instance
    * *description* - An optional description of the crash

The function will send a detailed stack trace of the exception including the error details, methods, files amd line numbers.

e.g.

```javascript
try {
   throw new Error("Something bad is going down");
} catch (e) {
    hockeyApp.reportError(e, "Caught a JavaScript exception");
}
```

#### Sending feedback

* **sendFeedback(text, parameters)**
    * *text* - Feedback text
    * *parameters* - Optional JSON object containing addtional feedback parameters

e.g.

```javascript
hockeyApp.sendFeedback("This app is really awesome", { subject: "Great App" });
```

#### Checking for app updates

* Ensure the **appVersion** property has been set
* Call **checkForUpdates()** to initiate the component to check for any app updates that are avilable for download.
* Handle the **onAvailableUpdatesChanged** signal
* The property **availableUpdates** is an array of JSON objects that contains details of each available update with a version number greater than **appVersion**.



## Issues

If you have ideas for improvements to the SDK or wish to report a bug (eeeek!), please feel free to create new or add to existing [issues](https://github.com/spatialdude/HockeySDK-QML/issues)
