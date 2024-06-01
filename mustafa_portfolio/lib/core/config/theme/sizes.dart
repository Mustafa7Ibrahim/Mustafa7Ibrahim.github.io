import 'dart:ui';

import 'package:flutter/material.dart';

/// the size of the screen of the device that the app is running on
Size size = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

/// the padding of the design is set to 132
double designPadding = 132;

/// padding section
double designPaddingSection = 67;

/// the padding of the design is set to 14
double designPaddingCenter = 14;

/// the padding of the design is set to 24
double designPaddingBetween = 24;

/// the radius of the design is set to 24
double designRadius = 24;

/// the radius of the design is set to 48
double designRadiusBig = 66;

/// the radius of the design is set to 150
double designRoundedRadius = 150;

/// This method is used to get device viewport width.
double get width => size.width;

///This method is used to get device viewport height.
num get height {
  final num statusBar = MediaQueryData.fromView(
    PlatformDispatcher.instance.views.first,
  ).viewPadding.top;
  final num screenHeight = size.height - statusBar;
  return screenHeight;
}
