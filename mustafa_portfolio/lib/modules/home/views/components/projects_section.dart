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
    required this.projectsKey,
    required this.projects,
    required this.onTapWork,
    required this.onTapAbout,
    super.key,
  });

  final List<Project> projects;

  final GlobalKey projectsKey;

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
      separatorBuilder: (context, index) => designPadding.ph,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(designPadding),
                      constraints: BoxConstraints(
                        minHeight: size.height,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(designRadius),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColor,
                            AppColors.secondaryColor,
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.decal,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (designPadding * 2).ph,
                          TitleIconWidget(
                            title: "Hi, I'm Mustafa",
                            icon: "👋",
                          ),
                          designPadding22.ph,
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
                          designPadding22.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: onTapWork,
                                child: const Text('My work'),
                              ),
                              designPadding22.pw,
                              OutlinedButton(
                                onPressed: onTapAbout,
                                child: const Text('About me'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ProjectItem(
                      key: projectsKey,
                      size: size,
                      index: index,
                      project: projects[index],
                    ),
                  ],
                ),
              ],
            ),
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
