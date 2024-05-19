import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/core_data/article_model.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';

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
    return Container(
      height: 350,
      margin: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 44,
                width: 8,
                color: AppColors.blueColor,
              ),
              24.pw,
              Expanded(
                child: Text(
                  article.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueColor,
                  ),
                ),
              ),
            ],
          ),
          24.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  article.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                24.ph,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 14,
                    runSpacing: 14,
                    children: [
                      if (article.devToLink != null)
                        OutlinedButton(
                          onPressed: () {
                            launchLink(article.devToLink!);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.dev,
                                size: 14,
                              ),
                              8.pw,
                              const Text('View Article'),
                            ],
                          ),
                        ),
                      if (article.hashnodeLink != null)
                        OutlinedButton(
                          onPressed: () {
                            launchLink(article.hashnodeLink!);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.hashnode,
                                size: 14,
                              ),
                              8.pw,
                              const Text('View Article'),
                            ],
                          ),
                        ),
                      if (article.mediumLink != null)
                        OutlinedButton(
                          onPressed: () {
                            launchLink(article.mediumLink!);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.medium,
                                size: 14,
                              ),
                              8.pw,
                              const Text('View Article'),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
