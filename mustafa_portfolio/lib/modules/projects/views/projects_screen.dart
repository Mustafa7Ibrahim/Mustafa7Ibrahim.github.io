import 'dart:ui';

import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/core_data/my_data_model.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/fottor.dart';
import 'package:mustafa_portfolio/modules/projects/bloc/portfolio_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// projects screen
class ProjectsScreen extends HookWidget {
  /// projects screen constructor
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          if (state.status == PortfolioStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: FittedBox(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 300,
                        maxWidth: 700,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          44.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                color: AppColors.blueColor,
                              ),
                              12.pw,
                              const Text(
                                'Projects',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 54,
                              vertical: 14,
                            ),
                            child: Text(
                              state.portfolio?.portfolioHeader ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.portfolio?.projects.length,
                            itemBuilder: (context, index) {
                              return ProjectTile(
                                project: state.portfolio!.projects[index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Footer(),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// project tile
class ProjectTile extends HookWidget {
  /// project tile constructor
  const ProjectTile({
    required this.project,
    super.key,
  });

  /// project
  final Project project;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Container(
      height: ResponsiveBreakpoints.of(context).isDesktop ? 350 : 600,
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
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).isDesktop
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            child: Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 44,
                          width: 8,
                          color: AppColors.blueColor,
                        ),
                        24.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blueColor,
                              ),
                            ),
                            4.ph,
                            Text(
                              project.header ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    24.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.description,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          24.ph,
                          Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 14,
                            runSpacing: 14,
                            children: [
                              if (project.appStoreLink != null)
                                OutlinedButton(
                                  onPressed: () {
                                    launchLink(project.appStoreLink!);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.appStoreIos,
                                        color: Colors.blue,
                                        size: 14,
                                      ),
                                      8.pw,
                                      const Text('App Store'),
                                    ],
                                  ),
                                ),
                              if (project.googlePlayLink != null)
                                OutlinedButton(
                                  onPressed: () {
                                    launchLink(project.googlePlayLink!);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.googlePlay,
                                        size: 14,
                                      ),
                                      8.pw,
                                      const Text('Google Play'),
                                    ],
                                  ),
                                ),
                              if (project.appGalleryLink != null)
                                OutlinedButton(
                                  onPressed: () {
                                    launchLink(project.appGalleryLink!);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.store,
                                        color: Colors.red,
                                        size: 14,
                                      ),
                                      8.pw,
                                      const Text('App Gallery'),
                                    ],
                                  ),
                                ),
                              if (project.githubLink != null)
                                OutlinedButton(
                                  onPressed: () {
                                    launchLink(project.githubLink!);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.github,
                                        size: 14,
                                      ),
                                      8.pw,
                                      const Text('Github'),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    24.ph,
                  ],
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: Expanded(
              flex: ResponsiveBreakpoints.of(context).isDesktop ? 2 : 3,
              child: SizedBox(
                height: 350,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: project.images.length,
                      itemBuilder: (context, imageIndex) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                    project.images[imageIndex],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0),
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              project.images[imageIndex],
                              fit: BoxFit.fitHeight,
                              height: 350,
                            ),
                          ],
                        );
                      },
                    ),
                    Positioned(
                      left: 0,
                      bottom: 8,
                      child: IconButton(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black87,
                          size: 18,
                        ),
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 8,
                      child: IconButton(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black87,
                          size: 18,
                        ),
                        onPressed: () {
                          pageController.nextPage(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
