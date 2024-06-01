import 'package:flutter/animation.dart';

/// This class is used to store all the colors used in the app.
class AppColors {
  /// This method is used to get background color.
  static Color get backgroundColor => const Color(0xFFF5F7FF);

  /// This method is used to get primary color.
  static Color get primaryColor => const Color(0xff140533);

  /// This method is used to get secondary color.
  static Color get secondaryColor => const Color(0xffDBE6FF);

  /// surface color
  static Color get surfaceColor => const Color.fromRGBO(245, 236, 230, 1);

  /// This method is used to get on main color.
  static Color get textPrimaryColor => const Color(0xff0B0B0B);

  /// This color is used for the text color on the primary color.
  static Color get textSecondaryColor => const Color(0xff505050);
}
