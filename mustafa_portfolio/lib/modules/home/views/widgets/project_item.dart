import 'package:cached_network_image/cached_network_image.dart';
import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/project_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/image_frame_widget.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    required this.size,
    required this.index,
    required this.project,
    super.key,
  });

  final Size size;
  final int index;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: designPadding * 3,
        right: designPadding * 3,
        top: index == 0 ? size.height * .7 : 0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: designPadding,
        horizontal: designPadding * 2,
      ),
      constraints: BoxConstraints(
        minHeight: size.height * 0.8,
        minWidth: size.width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(designRadius44),
        color: index.isOdd ? AppColors.secondaryColor : AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (project.logo != null)
                      CachedNetworkImage(
                        imageUrl: project.logo!,
                        width: 32,
                        height: 32,
                      ),
                    if (project.logo != null) designPaddingCenter.pw,
                    Text(
                      project.name,
                      style: context.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                designPadding.ph,
                designPadding.ph,
                Text(
                  'MOBILE APPLICATION',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                designPadding.ph,
                Text(
                  project.description,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                designPadding.ph,
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('View Project'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          designPadding.pw,
          ImageFrameWidget(project: project, size: size),
          designPadding.pw,
        ],
      ),
    );
  }
}
