import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Main class to change badge with static method [count].
class FlutterAppBadge {
  /// Get channel to invoke platform method
  static const MethodChannel _channel =
      const MethodChannel('nazarpunk/flutter_app_badge');

  /// Update badge count
  static Future<void> count(int count) {
    if (kIsWeb || !Platform.isIOS) return SynchronousFuture(null);
    if (count < 0) count = 0;
    return _channel.invokeMethod('count', {'count': count});
  }
}
