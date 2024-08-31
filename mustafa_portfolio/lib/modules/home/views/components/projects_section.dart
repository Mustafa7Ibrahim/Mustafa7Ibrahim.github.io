import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/project_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/project_item.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/title_icon_widget.dart';

/// home view for the app
class ProjectsSection extends HookWidget {
  /// home view for the app
  const ProjectsSection({
    required this.projects,
    required this.onTapWork,
    required this.onTapAbout,
    super.key,
  });

  final List<Project> projects;

  final VoidCallback onTapWork;

  final VoidCallback onTapAbout;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final size = MediaQuery.sizeOf(context);
    return ListView.separated(
      itemCount: projects.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => designPaddingSection.ph,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Stack(
            children: [
              ProjectHeader(
                size: size,
                width: width,
                onTapWork: onTapWork,
                onTapAbout: onTapAbout,
              ),
              ProjectItem(
                size: size,
                index: index,
                project: projects[index],
              ),
            ],
          );
        } else {
          return ProjectItem(
            size: size,
            index: index,
            project: projects[index],
          );
        }
      },
    );
  }
}

class ProjectHeader extends StatelessWidget {
  const ProjectHeader({
    super.key,
    required this.size,
    required this.width,
    required this.onTapWork,
    required this.onTapAbout,
  });

  final Size size;
  final double width;
  final VoidCallback onTapWork;
  final VoidCallback onTapAbout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34),
      constraints: BoxConstraints(
        minHeight: 1000,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: [
            // AppColors.secondaryColor,
            AppColors.surfaceColor,
            AppColors.backgroundColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          designPaddingSection.ph,
          TitleIconWidget(
            title: "Hi, I'm Mustafa",
            icon: "👋",
            showBorder: true,
          ),
          designPaddingCenter.ph,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.14,
            ),
            child: Text(
              'I develop mobile apps, and websites that blows your mind',
              style: context.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          designPaddingSection.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onTapWork,
                child: const Text('My work'),
              ),
              designPaddingCenter.pw,
              OutlinedButton(
                onPressed: onTapAbout,
                child: const Text('About me'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
