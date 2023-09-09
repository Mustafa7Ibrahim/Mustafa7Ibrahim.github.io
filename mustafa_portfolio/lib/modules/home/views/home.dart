import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mustafa_portfolio/core/assets/assets.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// home view for the app
class HomeView extends HookWidget {
  /// home view for the app
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: AppColors.primaryColor,
                ),
              ),
              ResponsiveRowColumnItem(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: AppColors.backgroundColor,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(designPadding),
              child: ResponsiveRowColumn(
                rowMainAxisAlignment: MainAxisAlignment.center,
                columnMainAxisAlignment: MainAxisAlignment.center,
                layout: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveRowColumnType.ROW
                    : ResponsiveRowColumnType.COLUMN,
                children: const [
                  ResponsiveRowColumnItem(child: MyInfo()),
                  ResponsiveRowColumnItem(child: MyInfoText()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///
class MyInfoText extends StatelessWidget {
  ///
  const MyInfoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(designPadding),
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          designPaddingCenter.ph,
          Text(
            "Here's who I am & what I do",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          designPadding.ph,
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('RESUME'),
              ),
              designPaddingCenter.pw,
              OutlinedButton(
                onPressed: () {},
                child: const Text('PROJECTS'),
              ),
            ],
          ),
          designPadding.ph,
          const Text(
            'I have a passion for mobile app development. I accomplished a lot in learning mobile app development through online courses and practicing it by making different applications. \n\nMore than 1 year of programming and application development experience. Searching for a job or internship as a mobile app developer.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

/// my info widget
class MyInfo extends StatelessWidget {
  /// my info widget
  const MyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(designPadding * 2.4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    designRoundedRadius,
                  ),
                  child: Image.asset(
                    Assets.me,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                designPadding.ph,
                Text(
                  'Mustafa',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ibrahim',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                designPaddingCenter.ph,
                SizedBox(
                  width: 50,
                  child: Divider(
                    color: AppColors.blueColor,
                    thickness: 2,
                  ),
                ),
                designPadding.ph,
                Text(
                  'Flutter Developer',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        letterSpacing: 2,
                      ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.backgroundColor,
            width: 350,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: designPadding,
                vertical: designPaddingBetween,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.twitter,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
