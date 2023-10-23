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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (!ResponsiveBreakpoints.of(context).isDesktop)
          Column(
            children: [
              Container(
                height: size.height * 0.3,
                width: double.infinity,
                color: AppColors.backgroundColor,
              ),
              Container(
                height: size.height * 0.34,
                width: double.infinity,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        Container(
          width: size.height * 0.4,
          height: size.height * 0.6,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        designRoundedRadius,
                      ),
                      child: Image.asset(
                        Assets.me,
                        width: size.height * 0.2,
                        height: size.height * 0.2,
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
                      const MainButtons(),
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
