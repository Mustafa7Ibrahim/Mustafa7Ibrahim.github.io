import 'package:cached_network_image/cached_network_image.dart';
import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/about_me_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/main_buttons.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/socials.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// my info widget
class MyInfo extends StatelessWidget {
  /// my info widget
  const MyInfo({
    required this.tabController,
    required this.aboutMe,
    super.key,
  });

  /// tab controller
  final TabController tabController;

  /// about me
  final AboutMe aboutMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 350,
            minHeight: 300,
            maxHeight: 555,
          ),
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        designRoundedRadius,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: aboutMe.image,
                        width: 200,
                        height: 200,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    designPadding.ph,
                    Text(
                      aboutMe.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    designPaddingCenter.ph,
                    SizedBox(
                      width: 50,
                      child: Divider(
                        color: AppColors.blueColor,
                        thickness: 2,
                      ),
                    ),
                    designPadding.ph,
                    if (ResponsiveBreakpoints.of(context).isDesktop)
                      Text(
                        aboutMe.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              letterSpacing: 2,
                            ),
                      )
                    else
                      MainButtons(
                        tabController: tabController,
                      ),
                  ],
                ),
              ),
              const Socials(),
            ],
          ),
        ),
      ],
    );
  }
}
