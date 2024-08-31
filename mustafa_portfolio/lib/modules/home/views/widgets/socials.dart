import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mustafa_portfolio/core/assets/assets.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/config/theme/text.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';

/// socials widget
class Socials extends StatelessWidget {
  /// socials widget
  const Socials({super.key, this.isFooter = false});

  /// isFooter
  final bool isFooter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        designPaddingCenter.ph,
        Text("Follow me on other platforms").bodyL,
        designPaddingCenter.ph,
        SocialButton(
          name: 'pub.dev',
          link: 'https://pub.dev/publishers/mustafaix.me/packages',
          isImage: true,
          image: Assets.dartLogo,
          index: 0,
        ),
        designPaddingCenter.ph,
        SocialButton(
          name: 'GitHub',
          link: 'https://github.com/Mustafa7Ibrahim/',
          icon: FontAwesomeIcons.github,
          index: 1,
        ),
        designPaddingCenter.ph,
        SocialButton(
          name: 'LinkedIn',
          link: 'https://www.linkedin.com/in/mustafa7ibrahim/',
          icon: FontAwesomeIcons.linkedin,
          index: 2,
        ),
        designPaddingCenter.ph,
        SocialButton(
          name: 'Twitter',
          link: 'https://twitter.com/Mustafa7Ibrahim',
          icon: FontAwesomeIcons.twitter,
          index: 3,
        ),
        designPaddingCenter.ph,
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.name,
    required this.link,
    required this.index,
    this.isImage = false,
    this.image,
    this.icon,
    super.key,
  });

  final String name;
  final String link;
  final bool isImage;
  final String? image;
  final IconData? icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchLink(link),
      child: Container(
        padding: EdgeInsets.all(designPaddingCenter),
        margin: EdgeInsets.only(
          right: designPaddingBetween * index,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.secondaryColor.withOpacity(0.5),
              AppColors.backgroundColor.withOpacity(0.5),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              padding: EdgeInsets.all(designPaddingCenter),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondaryColor,
                    AppColors.secondaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: isImage
                  ? Image.asset(
                      image!,
                      fit: BoxFit.contain,
                      height: 24,
                      width: 24,
                    )
                  : FaIcon(
                      icon,
                      color: AppColors.primaryColor,
                    ),
            ),
            designPaddingCenter.pw,
            Text(name).bodyL,
            Spacer(),
            Icon(Icons.double_arrow_rounded),
          ],
        ),
      ),
    );
  }
}
