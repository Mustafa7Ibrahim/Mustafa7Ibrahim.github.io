import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/article_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/image_widget.dart';

/// project tile
class ArticleTile extends HookWidget {
  /// project tile constructor
  const ArticleTile({
    required this.article,
    super.key,
  });

  /// project
  final Article article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(designRadius),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ImageWidget(
            image:
                "https://framerusercontent.com/images/6uTcNhyIPdUpIaZpOeYEZ8U276I.png",
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Container(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(designPaddingCenter),
                color: Colors.white,
                child: Text(
                  article.devToLink.toString(),
                  maxLines: 1,
                ),
              ),
              Container(
                padding: EdgeInsets.all(designPaddingCenter),
                color: Colors.white,
                child: Text(
                  article.name,
                  style: context.textTheme.titleLarge,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
