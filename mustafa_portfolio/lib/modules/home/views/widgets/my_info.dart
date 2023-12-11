import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/assets/assets.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/main_buttons.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/socials.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// my info widget
class MyInfo extends StatelessWidget {
  /// my info widget
  const MyInfo({
    required this.tabController,
    super.key,
  });

  /// tab controller
  final TabController tabController;

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
                      child: Image.asset(
                        Assets.me,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    designPadding.ph,
                    Text(
                      'Mustafa',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Ibrahim',
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
                        'Flutter Developer',
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
