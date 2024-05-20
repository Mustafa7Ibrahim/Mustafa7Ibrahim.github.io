import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/about_me_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/main_buttons.dart';
import 'package:responsive_framework/responsive_framework.dart';

///
class MyInfoText extends StatelessWidget {
  ///
  const MyInfoText({
    required this.tabController,
    required this.aboutMe,
    super.key,
  });

  /// tab controller
  final TabController tabController;

  /// about me
  final AboutMe aboutMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 600,
        minHeight: 550,
      ),
      padding: const EdgeInsets.all(44),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          designPaddingCenter.ph,
          Text(
            "Here's who I am & what I do",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          designPadding.ph,
          if (ResponsiveBreakpoints.of(context).isDesktop)
            MainButtons(
              tabController: tabController,
            ),
          Text(
            aboutMe.bio,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
