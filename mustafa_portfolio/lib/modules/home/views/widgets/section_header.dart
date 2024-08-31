import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/text.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 800,
      ),
      child: Text(title).heading3.center,
    );
  }
}
