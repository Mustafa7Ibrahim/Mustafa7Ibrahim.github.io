import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/section_header.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/title_icon_widget.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.tileTitle,
    required this.tileIcon,
    required this.headerTitle,
    required this.child,
  });

  final String tileTitle;
  final String tileIcon;
  final String headerTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 75),
      constraints: BoxConstraints(minWidth: size.width),
      margin: EdgeInsets.only(
        left: designPaddingSection,
        right: designPaddingSection,
        bottom: designPaddingSection,
      ),
      child: Column(
        children: [
          TitleIconWidget(title: tileTitle, icon: tileIcon),
          designPaddingBetween.ph,
          SectionHeader(title: headerTitle),
          designPaddingSection.ph,
          child,
        ],
      ),
    );
  }
}
