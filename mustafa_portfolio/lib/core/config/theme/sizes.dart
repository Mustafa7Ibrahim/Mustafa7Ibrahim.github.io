import 'dart:ui';

import 'package:flutter/material.dart';

/// the size of the screen of the device that the app is running on
Size size = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

/// the padding of the design is set to 44
double designPadding = 44;

/// the padding of the design is set to 22
double designPadding22 = 26;

/// the padding of the design is set to 12
double designPaddingCenter = 12;

/// padding 20
double designPadding20 = 20;

/// the padding of the design is set to 6
double designPaddingBetween = 6;

/// DESIGN RADIUS 44
double designRadius44 = 44;

/// the radius of the design is set to 18
double designRadius = 112;

/// the radius of the design is set to 150
double designRoundedRadius = 150;

///This method is used to get device viewport width.
double get width => size.width;

///This method is used to get device viewport height.
num get height {
  final num statusBar = MediaQueryData.fromView(
    PlatformDispatcher.instance.views.first,
  ).viewPadding.top;
  final num screenHeight = size.height - statusBar;
  return screenHeight;
}
