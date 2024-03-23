import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easix/easix.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mustafa_portfolio/core/assets/assets.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/core_data/my_data_model.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';

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
    final carouselController = useMemoized(CarouselController.new);
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 350),
      margin: const EdgeInsets.all(24),
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
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
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
                            if (project.pubDevLink != null)
                              OutlinedButton(
                                onPressed: () {
                                  launchLink(project.pubDevLink!);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      Assets.dartLogo,
                                      fit: BoxFit.contain,
                                      height: 14,
                                      width: 14,
                                    ),
                                    8.pw,
                                    const Text('Pub.dev'),
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
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(project.images.last),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 370,
                          viewportFraction: 1,
                          autoPlay: project.images.length > 1,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                        ),
                        items: project.images.map(
                          (e) {
                            return InkWell(
                              onTap: () {
                                final multiImageProvider = MultiImageProvider(
                                  [...project.images.map(NetworkImage.new)],
                                  initialIndex: project.images.indexOf(e),
                                );

                                showImageViewerPager(
                                  context,
                                  multiImageProvider,
                                  doubleTapZoomable: true,
                                  onPageChanged: (page) {
                                    carouselController.animateToPage(
                                      page,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  onViewerDismissed: (page) {
                                    carouselController.animateToPage(
                                      page,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl: e,
                                fit: BoxFit.fitHeight,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
