import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';

/// home view for the app
class HomeView extends HookWidget {
  /// home view for the app
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                color: AppColors.primaryColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                color: AppColors.backgroundColor,
              ),
            ],
          ),
          Row(
            children: [
              Card(
                color: AppColors.surfaceColor,
                margin: const EdgeInsets.all(24),
                child: Padding(
                  padding: EdgeInsets.all(designPadding),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Hello'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
