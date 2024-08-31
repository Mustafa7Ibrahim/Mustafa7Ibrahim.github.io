import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/article_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/article_tile.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/section_container.dart';

/// projects screen
class ArticlesScreen extends HookWidget {
  /// projects screen constructor
  const ArticlesScreen({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      tileTitle: "Blog",
      tileIcon: "📝",
      headerTitle: "I also write some stories about my projects and Packages",
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: designPaddingCenter,
          mainAxisSpacing: designPaddingCenter,
          childAspectRatio: 1,
        ),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleTile(
            article: articles[index],
          );
        },
      ),
    );
  }
}


