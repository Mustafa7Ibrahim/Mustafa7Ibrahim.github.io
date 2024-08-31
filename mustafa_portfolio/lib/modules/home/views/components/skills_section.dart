import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/section_container.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/set_widget.dart';

/// project tile
class SkillsSection extends HookWidget {
  /// project tile constructor
  const SkillsSection({
    required this.skills,
    super.key,
  });

  /// skills
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      tileTitle: "Skills",
      tileIcon: "🛠️",
      headerTitle:
          "I have a wide range of skills that I have developed over the years",
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: skills.length,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: designPaddingCenter,
          mainAxisSpacing: designPaddingCenter,
          childAspectRatio: 5,
        ),
        itemBuilder: (context, index) {
          return SetWidget(
            title: skills[index],
            onTap: () {},
            icon: Icon(
              Icons.code_sharp,
              color: AppColors.primaryColor,
              size: 34,
            ),
            isIcon: true,
          );
        },
      ),
    );
  }
}
