import 'dart:ui';

import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/config/theme/text.dart';

class WebNavBar extends StatelessWidget {
  const WebNavBar({
    super.key,
    required this.experienceKey,
    required this.projectsKey,
    required this.packagesKay,
    required this.articlesKey,
    required this.skillsKey,
    required this.goToWidgetByTag,
  });

  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final GlobalKey packagesKay;
  final GlobalKey articlesKey;
  final Function goToWidgetByTag;
  final GlobalKey skillsKey;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: designPaddingSection,
            vertical: designPaddingCenter,
          ),
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.5)),
          child: Row(
            children: [
              InkWell(
                onTap: () => goToWidgetByTag(projectsKey),
                child: Text('Mustafa Ibrahim').bodyM.extraBold,
              ),
              const Spacer(),
              TextButton(
                onPressed: () => goToWidgetByTag(packagesKay),
                child: const Text('Packages').bodyM,
              ),
              designPaddingCenter.pw,
              TextButton(
                onPressed: () => goToWidgetByTag(skillsKey),
                child: const Text('Skills').bodyM,
              ),
              designPaddingCenter.pw,
              TextButton(
                onPressed: () => goToWidgetByTag(experienceKey),
                child: const Text('Experience').bodyM,
              ),
              designPaddingCenter.pw,
              TextButton(
                onPressed: () => goToWidgetByTag(articlesKey),
                child: const Text('Blog').bodyM,
              ),
              designPaddingCenter.pw,
              ElevatedButton(
                onPressed: () {},
                child: const Text('Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
