import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/config/theme/text.dart';
import 'package:mustafa_portfolio/core/core_data/experience_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/section_container.dart';

/// project tile
class ExperienceSection extends HookWidget {
  /// project tile constructor
  const ExperienceSection({
    required this.experience,
    super.key,
  });

  /// skills
  final List<Experience> experience;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      tileTitle: "My Experience",
      tileIcon: "👨‍💻",
      headerTitle:
          "I have worked in different companies and gained experience in different fields.",
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: experience.length,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: designPaddingCenter,
          mainAxisSpacing: designPaddingCenter,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return ExperienceWidget(
            experience: experience[index],
          );
        },
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    super.key,
    required this.experience,
  });

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(designRadius),
      ),
      padding: EdgeInsets.all(designPaddingCenter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 66,
                width: 66,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.secondaryColor,
                      AppColors.surfaceColor,
                    ],
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(designRadius),
                ),
                child: Icon(
                  Icons.workspace_premium_outlined,
                  color: AppColors.primaryColor,
                  size: 34,
                ),
              ),
              designPaddingCenter.pw,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.company,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    // designPaddingCenter.ph,
                    Text(
                      experience.position,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
          designPaddingBetween.ph,
          ExperienceTile(
            title: experience.duration,
            icon: Icons.calendar_today,
          ),
          Divider(
            height: designPaddingBetween,
          ),
          ExperienceTile(
            title: experience.location,
            icon: Icons.location_on,
          ),
          Divider(
            height: designPaddingBetween,
          ),
          ExperienceTile(
            title: experience.description,
            icon: Icons.description,
          ),
        ],
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColors.primaryColor,
          size: 18,
        ),
        designPaddingCenter.pw,
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.start,
          ).bodyS,
        ),
      ],
    );
  }
}
