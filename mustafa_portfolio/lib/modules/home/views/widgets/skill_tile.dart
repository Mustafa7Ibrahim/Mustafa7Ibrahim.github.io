import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';

/// Skill tile
class SkillTile extends StatelessWidget {
  /// Skill tile constructor
  const SkillTile({required this.skill, super.key});

  /// skill
  final String skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 14,
            width: 14,
            color: AppColors.primaryColor,
          ),
          12.pw,
          Text(
            skill,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
