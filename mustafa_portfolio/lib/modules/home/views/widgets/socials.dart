import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mustafa_portfolio/core/assets/assets.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';

/// socials widget
class Socials extends StatelessWidget {
  /// socials widget
  const Socials({super.key, this.isFooter = false});

  /// isFooter
  final bool isFooter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      width: isFooter ? null : 350,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isFooter ? designPaddingBetween : designPadding,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              isFooter ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                launchLink('https://pub.dev/publishers/mustafaix.me/packages');
              },
              child: Image.asset(
                Assets.dartLogo,
                fit: BoxFit.contain,
                height: isFooter ? 18 : 20,
                width: isFooter ? 18 : 20,
              ),
            ),
            designPadding.pw,
            InkWell(
              onTap: () {
                launchLink('https://github.com/Mustafa7Ibrahim/');
              },
              child: FaIcon(
                FontAwesomeIcons.github,
                size: isFooter ? 18 : 20,
              ),
            ),
            designPadding.pw,
            InkWell(
              onTap: () {
                launchLink('https://www.linkedin.com/in/mustafa7ibrahim/');
              },
              child: FaIcon(
                FontAwesomeIcons.linkedin,
                color: AppColors.blueColor,
                size: isFooter ? 18 : 20,
              ),
            ),
            designPadding.pw,
            InkWell(
              onTap: () {
                launchLink('https://twitter.com/Mustafa7Ibrahim/');
              },
              child: FaIcon(
                FontAwesomeIcons.xTwitter,
                size: isFooter ? 18 : 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
