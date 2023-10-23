import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';

/// main buttons for resume and projects
class MainButtons extends StatelessWidget {
  /// main buttons
  const MainButtons({super.key});

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
              onPressed: () {},
              child: const Text('RESUME'),
            ),
            designPaddingCenter.pw,
            OutlinedButton(
              onPressed: () {},
              child: const Text('PROJECTS'),
            ),
          ],
        ),
        designPadding.ph,
      ],
    );
  }
}
