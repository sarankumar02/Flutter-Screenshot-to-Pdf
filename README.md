# screenshot_to_pdf

This is a simple Demo App in Flutter to show how you can save your whole screen or part of the screen
as PDF in the user's device

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# Flutter-Screenshot-to-Pdf"

## To run

Clone the project and go to the project's root folder
Open a Terminal or CMD and type "flutter run" without the quotes to run the project

## To add this function in your Project

Add all the dependencies of this project to your working project and get all dependencies using
pub get

Add Read , write External Storage permission in the android Manifest.xml
("android\app\src\main\AndroidManifest.xml)

Then Add screenshot widget to target the part you want to save as PDF.
Add this savePdfFile Function and pass your screenshot in Uint8List format and name of your PDF.

Then call this function in an user Event..i.e, Button Click etc
Thats all.You can now save your screenshot as PDF with not much effort
