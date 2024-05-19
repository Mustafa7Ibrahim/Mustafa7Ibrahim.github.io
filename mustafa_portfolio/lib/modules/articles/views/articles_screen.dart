import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/articles/widgets/article_tile.dart';
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
                                itemCount: state.articles.length,
                                itemBuilder: (context, index) {
                                  return ArticleTile(
                                    article: state.articles[index],
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
