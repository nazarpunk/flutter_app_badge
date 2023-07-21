# Flutter App Badger plugin

[![Pub](https://img.shields.io/pub/v/flutter_app_badger.svg)](https://pub.dev/packages/flutter_app_badge)

Fork of [flutter_app_badger](https://pub.dev/packages/flutter_app_badger).

This plugin for [Flutter](https://flutter.io) adds the ability to change the badge of the IOS app.

<p align="center">
  <img src="https://raw.githubusercontent.com/nazarpunk/flutter_app_badge/master/assets/ios.png" alt="Ios badge">
</p>

## Getting Started

### iOS

On iOS, the notification permission is required to update the badge.
It is automatically asked when the badge is added or removed.

Enable `Remote notification` in XCode:
<p align="center"><img src="https://raw.githubusercontent.com/nazarpunk/flutter_app_badge/master/assets/ios-remote-notifications.png" alt="IOS Remote notification"></p>

Or add in `<project>/ios/Runner/Info.plist`:
```xml
<key>UIBackgroundModes</key>
<array>
    <string>remote-notification</string>
</array>
```

### Dart

First, you just have to import the package in your dart files with:
```dart
import 'package:flutter_app_badge/flutter_app_badge.dart';
```

Then you can add a badge:
```dart
FlutterAppBadge.count(1);
```

Remove a badge:
```dart
FlutterAppBadge.count(0);
```