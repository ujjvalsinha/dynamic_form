# Dynamic Form App

## 1. Introduction

### Overview

This document serves as a comprehensive guide for the Flutter app developed to build dynamic user interfaces using JSON responses from the backend and submitting user-entered data to a remote server.

### Features

- Dynamic UI construction from JSON responses.
- Efficient state management using Flutter Bloc.
- Dependency injection facilitated by GetIt.
- Model generation through Freezed.
- Network calls handled by Dio.
- Local storage management using Hive.
- Image uplodation to AWS S3 bucket

### Technologies Used

- Flutter
- Dart

## 2. Setup and Installation

### Prerequisites

- Flutter SDK installed
- Dart SDK installed
- Code editor (e.g., VS Code, IntelliJ)
- Git

### Installation Steps

```shell script
$ git branch -m main develop
$ git fetch origin
$ git branch -u origin/develop develop
$ git remote set-head origin -a
```

- Install dependencies: `flutter pub get`
- Run the app: `flutter run`

## Environment

<img height="520px" src="https://miro.medium.com/max/1400/1*MqYPYKdNBiID0mZ-zyE-mA.png" align="right" />

=

**Android**

- Android 5.1+
  - minSdkVersion 21
- targetSdkVersion 30

## App architecture

- This design pattern helps to separate presentation from business logic. Following the BLoC pattern facilitates testability and reusability. This package abstracts reactive aspects of the pattern allowing developers to focus on writing the business logic.

## Cubit

The goal of this library is to make it easy to separate presentation from business logic, facilitating testability and reusability.

<p align="center">
  <img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/cubit_architecture_full.png" />
</p>

- A Cubit is class which extends BlocBase and can be extended to manage any type of state. Cubit requires an initial state which will be the state before emit has been called. The current state of a cubit can be accessed via the state getter and the state of the cubit can be updated by calling emit with a new state.

## Dependency Injection

- In Flutter, the default way to provide object/services to widgets is through InheritedWidgets. If you want a widget or it’s model to have access to a service, the widget has to be a child of the inherited widget. This causes unnecessary nesting.
- That’s where [get it](https://pub.dev/packages/get_it) comes in. An IoC that allows you to register your class types and request it from anywhere you have access to the container..

\_You don’t need to wrap any widgets to inherit anything, or need the context anywhere. All you do is import the service_locator file and use the locator to resolve your type. This means that in places without the context you’ll still be able to inject the correct services and values, even if the app’s UI structure changes.

## Project Structure

```
lib/
|-- core/
|   |-- app_config/
|   |-- constants/
|   |-- di/
|   |-- enum/
|   |-- error/
|   |-- local_storage/
|   |-- services/
|
|-- features/
|   |-- dynamic_form/
|   |   |-- presentation/
|   |   |-- domain/
|   |   |-- data/
|   |
|   |-- movie_details/
|   |   |-- presentation/
|   |   |-- domain/
|   |   |-- data/
|
|-- main.dart
```

- **core:** Contains the core logic of the application, following Clean Architecture principles.

- **features:** Contains feature-specific modules.

  - **dynamic_forms:** Module for displaying dynamic form screen with multiple widget.

  - **domain:** Defines entities, use cases, and repositories.
  - **data:** Implements data sources, repositories, and mappers.
  - **presentation:** Manages the UI, presentation logic, and state using Cubit.

  - **constants:** Holds constant values used throughout the app.
  - **widgets:** Custom widgets used in different parts of the application.

- **main.dart:** Entry point of the application.

## Code Style

- [Effective Dart](https://dart.dev/guides/language/effective-dart)

## Models

**If added some models for api results**

- Use [Freezed](https://pub.dev/packages/freezed)

## Getting Started

##Example Implementation

```dart
///Network service class
abstract class HttpService {
  Future<Response> handleGetRequest(String? path);
  Future<Response> handlePostRequest(String path,
      {Options? options, Map<String, dynamic>? data});
  Future<Response> handlePostRequestList(String path, List<dynamic>? data);
  Future<Response> handlePutRequest(String path,
      {Options? options, Map<String, dynamic>? data});
  Future<Response> handleDeleteRequest(String path);

  Future<Response> handleGetRequestWithoutToken(String path);
  Future<Response> handlePostRequestWithoutToken(String path,
      [Map<String, dynamic>? data]);
  Future<Response> handlePutRequestWithoutToken(String path,
      [Map<String, dynamic>? data]);
  Future<Response> handleDeleteRequestWithoutToken(String path);
}

```

```dart
// Repository service
abstract class DynamicFormRepository {
  Future<DynamicFormModel> getFormData();
  Future<bool> sendFormData(Map<String, dynamic> formData);
}
```

```dart
// Entities model for interacting with UI
class DynamicFormViewModel {
  final FormType formType;
  final bool mandatory;
  final String label;
  final List<String>? options;
  final int? imageCount;
  final TextInputType? textInputType;
  final String? savingFolder;
  final String? inputData;

  DynamicFormViewModel({
    required this.formType,
    required this.mandatory,
    required this.label,
    this.options,
    this.imageCount,
    this.textInputType,
    this.savingFolder,
    this.inputData,
  });
```

```dart
// Image uploadation to S3 bucket
 Future<void> _uploadImagesToS3(List<File> images) async {
    for (File image in images) {
      final result = await AwsS3.uploadFile(
        accessKey: "AKIAR*******KQY",
        secretKey: "06O0*********jhjh",
        file: image,
        bucket: "assignments-list",
        region: "ap-south-1",
        metadata: {"path": image.path},
      );
    }
  }
```

## Best Practices

#### Code Structure

- Follow the Flutter and Dart style guidelines.
- Organize code into modular components for reusability.

#### Naming Conventions

\*Adopt clear and consistent naming conventions for variables, classes, and methods.

#### Error Handling

- Implement robust error handling mechanisms for network requests and other potential issues.

```dart
class PolarisCustomError extends Error {
  final String? code;
  final String? message;

  PolarisCustomError({this.code, this.message});

  @override
  String toString() => 'HtpCustomError(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PolarisCustomError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

```

## Screenshot

<div align="center">
  <img src="https://i.ibb.co/7yhq6Tk/Screenshot-2024-03-06-at-3-07-21-AM.png" width="200" hspace="20">
  <img src="https://i.ibb.co/t8PKVKN/Screenshot-2024-03-06-at-3-08-11-AM.png" width="200" hspace="20">
  
</div>

<br>
<br>

<div align="center">
<img src="https://i.ibb.co/8DTRCzN/Screenshot-2024-03-06-at-3-10-35-AM.png" width="200" hspace="20">
 
  <img src="https://i.ibb.co/svTwhfM/Screenshot-2024-03-06-at-3-10-59-AM.png" width="200" hspace="20">
</div>

<br>
<br>
