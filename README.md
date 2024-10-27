# ⏰ On Time Task

**On Time Task** is a local task management application developed using Flutter, leveraging Hive for efficient data storage. This app enables users to manage tasks across categories such as "Today," "Done," and "Archived," with full CRUD (Create, Read, Update, Delete) operations and swipe-to-delete functionality for easy task removal. It adheres to Clean Architecture and SOLID principles to ensure maintainability and scalability, incorporating dependency injection, the Singleton pattern, and dependency inversion for optimal performance and code organization.

## 📜 Table of Contents
- [📖 Overview](#-overview)
- [✨ Features](#-features)
- [📐 Architecture and Code Structure](#-architecture-and-code-structure)
- [🛠 Technology Stack](#-technology-stack)
- [📦 Packages Used](#-packages-used)
- [🖼 Screenshots](#-screenshots)
- [🚀 Installation](#-installation)

## 📖 Overview
The On Time Task app provides a responsive and user-friendly interface for managing tasks with categorized views, note-taking capabilities, and a clean, accessible design. It serves as a robust foundation for organizing tasks and integrates modern Flutter techniques to deliver a seamless user experience.

## ✨ Features
- **Task Organization**: Users can organize tasks into categories like "Today," "Done," and "Archived."
- **Full CRUD Operations**: Supports full Create, Read, Update, and Delete functionalities.
- **Swipe-to-Delete Functionality**: Allows for easy task removal via swipe gesture.
- **Note-Taking**: Users can add notes to tasks for additional context.
- **Responsive UI**: Adapts to different screen sizes using `flutter_screenutil`.
- **Clean Architecture**: Follows a structured architecture with separate layers for data, domain, and presentation.
- **Design Principles**: Implements SOLID principles, dependency injection, Singleton pattern, and dependency inversion for efficient code management.

## 📐 Architecture and Code Structure
The project is organized for task separation and scalability:
- **Data Layer**: Manages data storage using Hive and provides CRUD operations for tasks.
- **Domain Layer**: Contains core logic, separating data storage from the user interface.
- **Presentation Layer**: Displays UI components, using widgets to show tasks in their respective categories.
- **Utilities**: Provides helper functions for seamless task management and local storage.

## 🛠 Technology Stack
- **Flutter**: Used for cross-platform app development on Android and iOS.
- **Dart**: Programming language used for Flutter development.
- **Hive**: NoSQL database for efficient local data storage.

## 📦 Packages Used
1. **[cupertino_icons](https://pub.dev/packages/cupertino_icons)**: Provides iOS icons for UI elements.
2. **[dartz](https://pub.dev/packages/dartz)**: Functional programming in Dart, used for error handling and Either pattern.
3. **[flutter](https://flutter.dev)**: The Flutter SDK for cross-platform development.
4. **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: Manages app state with Bloc pattern.
5. **[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)**: Enables responsive design for various screen sizes.
6. **[hive](https://pub.dev/packages/hive)**: Key-value database for efficient local storage.
7. **[hive_flutter](https://pub.dev/packages/hive_flutter)**: Adds Hive support for Flutter.
8. **[intl](https://pub.dev/packages/intl)**: Provides date and time formatting.

## 🖼 Screenshots
![Screenshot 1](assets/images/task_list_1.png)
![Screenshot 2](assets/images/task_list_2.png)
![Screenshot 3](assets/images/task_list_3.png)
![Screenshot 4](assets/images/task_list_4.png)
![Screenshot 5](assets/images/task_list_5.png)
![Screenshot 6](assets/images/task_list_6.png)
![Screenshot 7](assets/images/task_list_7.png)
![Screenshot 8](assets/images/task_list_8.png)
![Screenshot 9](assets/images/task_list_9.png)
![Screenshot 10](assets/images/task_list_10.png)
![Screenshot 11](assets/images/task_list_11.png)

## 🚀 Installation
To run the On Time Task app locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/on_time_task
   cd on_time_task
