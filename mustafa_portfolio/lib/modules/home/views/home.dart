import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/fottor.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/my_info.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/my_info_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// home view for the app
class HomeView extends HookWidget {
  /// home view for the app
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveBreakpoints.of(context).isDesktop
            ? SizedBox(
                width: double.infinity,
                height: size.height,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: MyInfo()),
                        Expanded(child: MyInfoText()),
                      ],
                    ),
                    Spacer(),
                    Footer(),
                  ],
                ),
              )
            : const Column(
                children: [
                  MyInfo(),
                  MyInfoText(),
                  Footer(),
                ],
              ),
      ),
    );
  }
}
