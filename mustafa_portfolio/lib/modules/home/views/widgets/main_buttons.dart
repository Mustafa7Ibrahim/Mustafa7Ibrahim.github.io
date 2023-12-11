import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';

/// main buttons for resume and projects
class MainButtons extends StatelessWidget {
  /// main buttons
  const MainButtons({required this.tabController, super.key});

  /// tab controller
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                downloadFile(
                  'assets/Mustafa_Ibrahim_Resume.pdf',
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18),
              ),
              child: const Text('RESUME'),
            ),
            designPaddingCenter.pw,
            OutlinedButton(
              onPressed: () {
                tabController.animateTo(2);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(18),
              ),
              child: const Text('PROJECTS'),
            ),
          ],
        ),
        designPadding.ph,
      ],
    );
  }
}
