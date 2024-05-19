import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/fottor.dart';
import 'package:mustafa_portfolio/modules/projects/bloc/portfolio_bloc.dart';
import 'package:mustafa_portfolio/modules/resume/widgets/education_tile.dart';
import 'package:mustafa_portfolio/modules/resume/widgets/experience_tile.dart';
import 'package:mustafa_portfolio/modules/resume/widgets/skills_languages.dart';

/// projects screen
class ResumeScreen extends HookWidget {
  /// projects screen constructor
  const ResumeScreen({super.key});

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
                                'Resume',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          16.ph,
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 34,
                              vertical: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Experience',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    final link = state.aboutMe?.cv;
                                    if (link == null) {
                                      return;
                                    }
                                    downloadFileFromWeb(link);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(18),
                                  ),
                                  child: const Text('Download Resume'),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.experiences.length,
                            itemBuilder: (context, index) {
                              return ExperienceTile(
                                experience: state.experiences[index],
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 34,
                              vertical: 16,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Education',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.educations.length,
                            itemBuilder: (context, index) {
                              return EducationTile(
                                experience: state.educations[index],
                              );
                            },
                          ),
                          Skills(
                            languages: state.languages,
                            skills: state.skills,
                          ),
                        ],
                      ),
                    ),
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
