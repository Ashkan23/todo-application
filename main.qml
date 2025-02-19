import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 200
    height: 400
    title: "To-Do App"

    // Use ListModel for tasks
    ListModel {
        id: tasksModel
    }

    Column {
        anchors.centerIn: parent
        spacing: 5

        Label {
            text: "Card Title"
        }
        TextField {
            id: titleInput
            placeholderText: "Enter title"
            width: 150

            background: Rectangle {
                border.color: "white"  // Set the border color to white
                border.width: 5       // Adjust border thickness if needed
                radius: 5              // Optional: Make rounded corners
            }
        }


        Item {
            height: 10
            width: 50
        }

        Label {
            text: "Card Description"
        }
        TextField {
            id: descriptionInput
            placeholderText: "Enter description"
            height: 100
            width: 150
            wrapMode: Text.Wrap

            background: Rectangle {
                border.color: "white"  // Set the border color to white
                border.width: 5       // Adjust border thickness if needed
                radius: 5              // Optional: Make rounded corners
            }
        }

        Item {
            height: 10
            width: 50
        }

        Label {
            text: "Card Color"
        }
        TextField {
            id: colorInput
            placeholderText: "Enter color (e.g., red, #00ff00)"
            width: 150

            background: Rectangle {
                border.color: "white"  // Set the border color to white
                border.width: 5       // Adjust border thickness if needed
                radius: 5              // Optional: Make rounded corners
            }
        }

        CheckBox {
            id: invertTextColor
            text: "Invert Text Color"
        }

        Item {
            height: 30
            width: 50
        }

        Button {
            text: "+ Add"
            height: 30
            width: 60
            anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 15
            background: Rectangle {
                color: "#3498db"
                border.color: "transparent"
                border.width: 5
                radius: 5
            }
            contentItem: Text {
                text: parent.text
                font.pixelSize: parent.font.pixelSize
                font.bold: true
                color: "white"
            }
            onClicked: {
                var currentDate = new Date().toLocaleDateString();  // Get current date
                tasksModel.append({
                    title: titleInput.text,
                    description: descriptionInput.text,
                    color: colorInput.text,
                    invertText: invertTextColor.checked,
                    checked: false, // Initialize checkbox state
                    date: currentDate  // Store date in task model
                })

                taskWindow.visible = true;

                // Clear input fields
                titleInput.text = "";
                descriptionInput.text = "";
                colorInput.text = "";
                invertTextColor.checked = false;
            }
        }
    }

    // Include the TaskWindow and pass the model
    TaskWindow {
        id: taskWindow
        visible: false
        tasksModel: tasksModel
    }
}
