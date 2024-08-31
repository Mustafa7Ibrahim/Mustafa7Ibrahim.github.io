import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/text.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';

class TitleIconWidget extends StatelessWidget {
  const TitleIconWidget({
    required this.title,
    required this.icon,
    this.showBorder = false,
    super.key,
  });

  final String title;
  final String icon;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: designPaddingCenter,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(designRadius),
        gradient: LinearGradient(
          colors: [
            AppColors.surfaceColor,
            AppColors.secondaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: showBorder ? AppColors.backgroundColor : Colors.transparent,
          width: 0,
        ),
      ),
      child: Text("${title} $icon").bodyL,
    );
  }
}
