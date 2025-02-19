=======================Qt Quick To-Do Application=======================

==>Overview

This is a simple To-Do application built using Qt Quick and QML. It allows users to create task cards with a title, description, color, and an option to invert text color. Tasks can be marked as completed and deleted when no longer needed.


==>Features

Add tasks with a title, description, and customizable color.

Invert text color for better readability.

View tasks in a separate window with a scrollable list.

Mark tasks as completed with a checkbox.

Delete selected tasks.


==>Project Structure
.
├── main.cpp
├── main.qml
└── TaskWindow.qml


==>Files Description

----main.cpp----

. Sets up the Qt application and loads the QML interface.

. Handles translation based on system locale.


----main.qml----

. The main entry point for the application interface.

. Allows users to input task title, description, color, and text inversion option.

. Contains a button to add tasks to the list and open the task view window.


----TaskWindow.qml----

. Displays the list of tasks in a separate window.

. Tasks are shown as color-coded cards with title, description, date, and a checkbox.

. Tasks can be marked as completed using the checkbox.

. Provides a button to delete selected tasks.


==>How to Run the project

1. Install Qt (with Qt Quick module) and Qt Creator.

2. Open the project in Qt Creator.

3. Build and run the application.


==>Dependencies

. Qt 5.15 or Qt 6.x

. Qt Quick Controls 2

. Qt Quick Layouts


==>Future Improvements

. Persistent data storage (e.g., JSON, SQLite).

. Task editing functionality.

. Enhanced task filtering and sorting.

. Customizable themes.
