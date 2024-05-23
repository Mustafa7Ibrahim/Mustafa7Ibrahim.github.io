import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';

class TitleIconWidget extends StatelessWidget {
  const TitleIconWidget({
    required this.title,
    required this.icon,
    super.key,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: designPaddingCenter,
        vertical: designPaddingBetween,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(designRadius),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.decal,
        ),
        border: Border.all(
          color: AppColors.backgroundColor,
          width: 2,
        ),
      ),
      child: Text(
        "${title} $icon",
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
