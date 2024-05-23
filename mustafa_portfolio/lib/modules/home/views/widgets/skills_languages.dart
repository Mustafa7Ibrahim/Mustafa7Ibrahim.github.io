import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/core_data/language_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/skill_tile.dart';

/// project tile
class Skills extends HookWidget {
  /// project tile constructor
  const Skills({
    required this.skills,
    required this.languages,
    super.key,
  });

  /// skills
  final List<String> skills;

  /// languages
  final List<Language> languages;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Professional skillset',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          24.ph,
          Wrap(
            children: [
              for (final skill in skills)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: SkillTile(skill: skill),
                ),
            ],
          ),
          44.ph,
          const Text(
            'Languages',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          24.ph,
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (final skill in languages)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: SkillTile(
                    skill: '${skill.name} (${skill.proficiency})',
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
