# Flutter App Badger plugin

[![Pub](https://img.shields.io/pub/v/flutter_app_badger.svg)](https://pub.dartlang.org/packages/flutter_app_badger)

Fork of [flutter_app_badger](https://pub.dev/packages/flutter_app_badger).

This plugin for [Flutter](https://flutter.io) adds the ability to change the badge of the app in the launcher.
It supports iOS, macOS, and some Android devices (the official API does not support the feature, even on Oreo).

<p align="center">
  <img src="https://raw.githubusercontent.com/nazarpunk/flutter_app_badge/master/assets/ios.png" alt="Android badge" style="margin:auto" width="600" 
height="228">
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/nazarpunk/flutter_app_badge/master/assets/android.png" alt="Android badge" style="margin:auto" width="600" 
height="322">
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

## macOS

On macOS, the notification permission is required to update the badge.
It is automatically asked when the badge is added or removed.

Please also add the following to your `<project>/macos/Runner/Info.plist`:
```xml
<key>NSUserNotificationAlertStyle</key>
<string>banner</string>
```

### Android

On Android, no official API exists to show a badge in the launcher. But some devices (Samsung, HTC...) support the feature.
Thanks to the [Shortcut Badger library](https://github.com/leolin310148/ShortcutBadger/), ~ 16 launchers are supported.


### Dart

First, you just have to import the package in your dart files with:
```dart
import 'package:flutter_app_badge/flutter_app_badge.dart';
```

Then you can add a badge:
```dart
FlutterAppBadge.updateBadgeCount(1);
```

Remove a badge:
```dart
FlutterAppBadge.updateBadgeCount(0);
```

Or just check if the device supports this feature with:
```dart
FlutterAppBadge.isAppBadgeSupported();
```
