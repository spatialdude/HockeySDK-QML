import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

RowLayout {
    Layout.fillWidth: true

    property alias label: label.text
    property alias value: textField.text
    property alias readOnly: textField.readOnly

    Label {
        id: label

        Layout.preferredWidth: 100

        font.italic: textField.readOnly
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignRight
    }

    TextField {
        id: textField

        Layout.fillWidth: true

        textColor: readOnly ? "blue" : "black"
        readOnly: true
    }
}
