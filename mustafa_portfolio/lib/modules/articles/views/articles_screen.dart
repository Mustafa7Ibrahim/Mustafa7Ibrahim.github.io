import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/my_data_model.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/fottor.dart';
import 'package:mustafa_portfolio/modules/projects/bloc/portfolio_bloc.dart';

/// projects screen
class ArticlesScreen extends HookWidget {
  /// projects screen constructor
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          if (state.status == PortfolioStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height,
                  ),
                  child: Column(
                    children: [
                      FittedBox(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 300,
                            maxWidth: 700,
                          ),
                          child: Column(
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
                                itemCount: state.portfolio?.articles.length,
                                itemBuilder: (context, index) {
                                  return ArticleTile(
                                    article: state.portfolio!.articles[index],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          );
        },
      ),
    );
  }
}

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
                      Visibility(
                        visible: article.devToLink != null,
                        replacement: const SizedBox(),
                        child: OutlinedButton(
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
                      ),
                      Visibility(
                        visible: article.hashnodeLink != null,
                        replacement: const SizedBox(),
                        child: OutlinedButton(
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
                      ),
                      Visibility(
                        visible: article.mediumLink != null,
                        replacement: const SizedBox(),
                        child: OutlinedButton(
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
