import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Tasks"

    property alias tasksModel: tasksView.model

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#F5F5F5"

        Column {
            width: parent.width
            anchors.fill: parent
            anchors.topMargin: 20  // Leaves space at the top

            // Scrollable Task List
            ScrollView {
                width: parent.width
                height: parent.height - 80  // Leaves space for button
                clip: true

                ListView {
                    id: tasksView
                    width: parent.width
                    model: tasksModel
                    spacing: 15  // Added spacing between tasks
                    clip: true  // Prevents content overflow

                    delegate: Rectangle {
                        width: parent.width - 40
                        height: implicitHeight + 150
                        color: model.color ? model.color : "#FFFFFF"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 15

                        Column {
                            width: parent.width - 30
                            spacing: 5
                            anchors.left: parent.left
                            anchors.leftMargin: 15

                            // Title (Always at the top)
                            Text {
                                text: model.title
                                font.bold: true
                                color: model.invertText ? "black" : "white"
                                font.pixelSize: 15
                                wrapMode: Text.Wrap
                                width: parent.width
                            }

                            // Description (Starts below title)
                            Text {
                                text: model.description
                                color: model.invertText ? "black" : "white"
                                wrapMode: Text.Wrap
                                width: parent.width
                                height: 100
                                maximumLineCount: 5  // Prevents excessive growth
                                elide: Text.ElideRight
                            }

                            // Date (Bottom-right of task)
                            Text {
                                text: "Date: " + model.date
                                font.pixelSize: 12
                                color: model.invertText ? "black" : "lightgray"
                                anchors.left: parent.left
                                anchors.leftMargin: 5  // Adds space from the left border
                                anchors.bottomMargin: 5  // Adds space from the bottom border
                            }
                        }

                        // Checkbox (Top-right, stays in place)
                        Rectangle {
                            id: checkBox
                            width: 20
                            height: 20
                            radius: 5
                            border.color: "black"
                            border.width: 1
                            color: model.checked ? "brown" : "lightgray"
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10


                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    model.checked = !model.checked;
                                }
                            }
                        }
                    }
                }
            }

            // "Delete Selected Tasks" Button (Always at bottom)
            Button {
                text: "Delete Selected Tasks"
                width: 160
                height: 35
                font.bold: true
                font.pixelSize: 15
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20  // Keeps it in place

                background: Rectangle {
                    color: "#3498db"
                    radius: 10
                }

                contentItem: Text {
                    text: parent.text
                    font.pixelSize: parent.font.pixelSize
                    font.bold: true
                    color: "white"
                }

                onClicked: {
                    for (var i = tasksModel.count - 1; i >= 0; i--) {
                        if (tasksModel.get(i).checked) {
                            tasksModel.remove(i);
                        }
                    }
                }
            }
        }
    }
}
