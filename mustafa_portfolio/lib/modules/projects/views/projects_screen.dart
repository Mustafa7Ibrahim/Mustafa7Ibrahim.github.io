import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/fottor.dart';
import 'package:mustafa_portfolio/modules/projects/bloc/portfolio_bloc.dart';
import 'package:mustafa_portfolio/modules/projects/views/widgets/project_tile.dart';

/// projects screen
class ProjectsScreen extends HookWidget {
  /// projects screen constructor
  const ProjectsScreen({super.key});

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
          return ListView(
            children: [
              Center(
                child: FittedBox(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 300,
                      maxWidth: 700,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              'Projects',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 54,
                            vertical: 14,
                          ),
                          child: Text(
                            state.portfolio?.portfolioHeader ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.portfolio?.projects.length,
                          itemBuilder: (context, index) {
                            return ProjectTile(
                              project: state.portfolio!.projects[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Footer(),
            ],
          );
        },
      ),
    );
  }
}
