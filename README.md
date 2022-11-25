# Endpoint2

A endpoint2 project created in flutter using Cubit With Bloc. endpoint2 supports both iOS and Android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/BalaMuruganSoftsuave/endPoint2 (stable channel)
## Description
In endpoint2 project,opens with charterer search screen.In this Ui ,One search bar and search results card are implemented with help of API.
If entered data doesn't match with data,it show "Not found". After That I implement  add charter screen,If user wants to add charter ,they can add with this screem.
It includes Name field, email field, country, country code,mobile number ,website. Some of front end validation also provide for email and Website field.
This app both support on dark and light mode depends on system setting. Also I integrated some third parties for Country picking option.

## Getting Started

The endpoint2 contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using this code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/BalaMuruganSoftsuave/endPoint2
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```


## endpoint2 Features:

* Charterer Search
* Add Charterer
* Both dark and Light mode Support

### Libraries & Tools Used

* bloc
* Country picker
* flutter_svg
* http

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- bloc/
|- helper/
|- modal/
|- screens/
|- widgets/
|- main.dart
```


### bloc

This directory contains Cubit which maintains app State.

```
bloc/
|- charter_cubit.dart
```

### helper

This directory contains all the helper files which need in entire app.
```
helper/
    |- api_constants.dart
    |- api_helper.dart
    |- app_color.dart
    |- app_style.dart
    |- dialog_helper.dart
    |- nav_helper.dart
    |- nav_observer.dart
    |- utils.dart
    
   
```
### modal

In modal directory we should store all data from API.
```
modal/
    |- charter_list.dart
    |- login_response.dart
```

### screens

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
screens/
   |- add_charter_screen.dart
   |- search_contract_screen.dart

```


### widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

```
widgets/
|- text_field_widget.dart
```

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the endpoint2 then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured project Structure.