import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/config/theme/text.dart';
import 'package:mustafa_portfolio/core/core_data/about_me_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/image_widget.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/section_header.dart';

/// my info widget
class AboutMeSection extends StatelessWidget {
  /// my info widget
  const AboutMeSection({
    required this.aboutMe,
    super.key,
  });

  /// about me
  final AboutMe aboutMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(designPaddingSection),
      constraints: BoxConstraints(minWidth: size.width),
      margin: EdgeInsets.only(
        top: 82,
        left: designPadding,
        right: designPadding,
        bottom: designPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(designRadiusBig),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SectionHeader(title: "Hi I'm Mustafa 👋"),
                designPaddingBetween.ph,
                Text(aboutMe.bio).bodyM,
                designPaddingSection.ph,
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Send me a message"),
                )
              ],
            ),
          ),
          designPadding.pw,
          ImageWidget(
            image: aboutMe.image,
            width: 350,
            height: 500,
          ),
        ],
      ),
    );
  }
}

/// my info widget
class AboutMeSectionMedium extends StatelessWidget {
  /// my info widget
  const AboutMeSectionMedium({
    required this.aboutMe,
    super.key,
  });

  /// about me
  final AboutMe aboutMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(designPaddingBetween),
      constraints: BoxConstraints(minWidth: size.width),
      margin: EdgeInsets.only(
        top: 82,
        left: designPaddingSection,
        right: designPaddingSection,
        bottom: designPaddingSection,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(designRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SectionHeader(title: "Hi I'm Mustafa 👋"),
                designPaddingBetween.ph,
                Text(aboutMe.bio).bodyM,
                designPaddingSection.ph,
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Send me a message"),
                )
              ],
            ),
          ),
          designPaddingSection.pw,
          ImageWidget(
            image: aboutMe.image,
            width: 300,
            height: 400,
          ),
        ],
      ),
    );
  }
}

/// my info widget
class AboutMeSectionCompact extends StatelessWidget {
  /// my info widget
  const AboutMeSectionCompact({
    required this.aboutMe,
    super.key,
  });

  /// about me
  final AboutMe aboutMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(designPaddingBetween),
      constraints: BoxConstraints(minWidth: size.width),
      margin: EdgeInsets.only(
        top: 82,
        left: designPaddingBetween,
        right: designPaddingBetween,
        bottom: designPaddingBetween,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(designRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageWidget(
            image: aboutMe.image,
            height: 400,
            radius: designRadius,
          ),
          designPaddingBetween.ph,
          SectionHeader(title: "Hi I'm Mustafa 👋"),
          designPaddingBetween.ph,
          Text(aboutMe.bio).bodyM,
          designPaddingBetween.ph,
          SizedBox(
            width: size.width,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Send me a message"),
            ),
          ),
        ],
      ),
    );
  }
}
