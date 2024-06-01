import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/config/theme/text.dart';
import 'package:mustafa_portfolio/core/core_data/about_me_model.dart';
import 'package:mustafa_portfolio/core/core_data/project_model.dart';
import 'package:mustafa_portfolio/core/responsive/responsive_layouts.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/socials.dart';

/// footer
class FooterSection extends StatelessWidget {
  /// footer
  const FooterSection({
    super.key,
    required this.aboutMe,
    required this.projects,
    required this.windowSizeResponsive,
  });

  final AboutMe aboutMe;
  final List<Project> projects;
  final WindowSizeResponsive windowSizeResponsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowSizeResponsive.isCompact
            ? designPaddingBetween
            : designPaddingSection,
        vertical: designPaddingCenter,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(designRadius),
          topRight: Radius.circular(designRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (windowSizeResponsive.isCompact)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Socials(),
                designPaddingBetween.pw,
                NavigationFooterWidget(),
                designPaddingBetween.pw,
                ProjectNavigationWidget(projects: projects)
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Socials()),
                designPaddingBetween.pw,
                SizedBox(
                  height: 300,
                  child: VerticalDivider(
                    color: Colors.black.withOpacity(0.1),
                    thickness: 0,
                  ),
                ),
                designPaddingBetween.pw,
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NavigationFooterWidget(),
                      if (windowSizeResponsive.isExpanded) Spacer(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: designPaddingBetween),
                          child: ProjectNavigationWidget(projects: projects),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          designPaddingSection.ph,
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Text(
                  '© 2024 ${aboutMe.name} All Rights Reserved',
                ).bodyS,
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    FooterItem(title: 'call: ', value: aboutMe.phone),
                    designPaddingCenter.pw,
                    FooterItem(title: 'write: ', value: aboutMe.email),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectNavigationWidget extends StatelessWidget {
  const ProjectNavigationWidget({
    super.key,
    required this.projects,
  });

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        designPaddingBetween.ph,
        Text("Projects").bodyL,
        designPaddingBetween.ph,
        for (final project in projects)
          Container(
            margin: EdgeInsets.only(
              bottom: designPaddingCenter,
            ),
            child: InkWell(
              onTap: () {},
              child: Text(
                project.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ).bodyM,
            ),
          ),
      ],
    );
  }
}

class NavigationFooterWidget extends StatelessWidget {
  const NavigationFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        designPaddingBetween.ph,
        Text("Navigation").bodyL,
        designPaddingBetween.ph,
        InkWell(onTap: () {}, child: Text("Work").bodyM),
        designPaddingCenter.ph,
        InkWell(onTap: () {}, child: Text("Packages").bodyM),
        designPaddingCenter.ph,
        InkWell(onTap: () {}, child: Text("Skills").bodyM),
        designPaddingCenter.ph,
        InkWell(onTap: () {}, child: Text("Blogs").bodyM),
        designPaddingCenter.ph,
        InkWell(onTap: () {}, child: Text("About me").bodyM),
        designPaddingCenter.ph,
      ],
    );
  }
}

/// footer item
class FooterItem extends StatelessWidget {
  /// footer item
  const FooterItem({
    required this.title,
    required this.value,
    super.key,
  });

  /// footer item title
  final String title;

  /// footer item value
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title).bodyS,
        SelectableText(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
