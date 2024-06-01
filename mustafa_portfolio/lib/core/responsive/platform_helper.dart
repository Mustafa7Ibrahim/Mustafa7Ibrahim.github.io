import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

abstract class PlatformHelper {
  static bool _matchPlatform(List<TargetPlatform> platforms) {
    return platforms.any((p) => defaultTargetPlatform == p);
  }

  static bool get isMobileDevice {
    return !kIsWeb &&
        _matchPlatform([TargetPlatform.iOS, TargetPlatform.android]);
  }

  static bool get isDesktopDevice {
    return !kIsWeb &&
        _matchPlatform(
          [TargetPlatform.macOS, TargetPlatform.windows, TargetPlatform.linux],
        );
  }

  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

  static bool get isMaterialApp {
    if (kIsWeb) return true;

    if (_matchPlatform(
        [TargetPlatform.iOS, TargetPlatform.macOS, TargetPlatform.linux])) {
      return false;
    } else {
      return true;
    }
  }
}
