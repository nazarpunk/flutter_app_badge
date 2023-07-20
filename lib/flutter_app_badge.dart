import 'dart:async';

import 'package:flutter/services.dart';

/// Main class to change badge with static methods
class FlutterAppBadger {
  static const MethodChannel _channel =
      const MethodChannel('nazarpunk/flutter_app_badge');

  /// Update badge
  static Future<void> updateBadgeCount(int count) {
    return _channel.invokeMethod('updateBadgeCount', {"count": count});
  }

  /// Remove badge
  static Future<void> removeBadge() {
    return _channel.invokeMethod('removeBadge');
  }

  /// Check badge support
  static Future<bool> isAppBadgeSupported() async {
    bool? appBadgeSupported =
        await _channel.invokeMethod('isAppBadgeSupported');
    return appBadgeSupported ?? false;
  }
}
