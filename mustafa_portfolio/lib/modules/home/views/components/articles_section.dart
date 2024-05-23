import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/core_data/article_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/article_tile.dart';

/// projects screen
class ArticlesScreen extends HookWidget {
  /// projects screen constructor
  const ArticlesScreen({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              'Article',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return ArticleTile(
              article: articles[index],
            );
          },
        ),
      ],
    );
  }
}
