import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/main_buttons.dart';
import 'package:responsive_framework/responsive_framework.dart';

///
class MyInfoText extends StatelessWidget {
  ///
  const MyInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveBreakpoints.of(context).isDesktop
          ? size.width * 0.5
          : double.infinity,
      padding: EdgeInsets.all(designPadding),
      color: (ResponsiveBreakpoints.of(context).isDesktop)
          ? null
          : AppColors.primaryColor,
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
          if (ResponsiveBreakpoints.of(context).isDesktop) const MainButtons(),
          Text(
            '''
With a B.CompSC degree from New Cairo Academy and two Udemy certifications, I have a strong foundation in computer science and mobile app development. I am proficient in Flutter and Dart, a cross-platform framework and language that enable fast and beautiful app creation.

As a Software Mobile Engineer at InCode Hub, I develop and maintain mobile applications for various clients and industries. I have more than 1 year of programming and app development experience, and I have completed multiple projects, such as Vicevio, a social media app that I worked on for 3 months. I use problem solving skills and continuous integration practices to ensure quality and efficiency in my work. I am passionate about learning new technologies and solving challenging problems, and I am looking for an opportunity to grow and contribute as a mobile app developer.
            ''',
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
