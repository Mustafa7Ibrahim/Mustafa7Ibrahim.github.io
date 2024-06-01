import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/responsive/responsive_layouts.dart';
import 'package:mustafa_portfolio/modules/home/bloc/portfolio_bloc.dart';
import 'package:mustafa_portfolio/modules/home/views/components/about_me_section.dart';
import 'package:mustafa_portfolio/modules/home/views/components/articles_section.dart';
import 'package:mustafa_portfolio/modules/home/views/components/experience_section.dart';
import 'package:mustafa_portfolio/modules/home/views/components/fottor_section.dart';
import 'package:mustafa_portfolio/modules/home/views/components/packages_section.dart';
import 'package:mustafa_portfolio/modules/home/views/components/projects_section.dart';
import 'package:mustafa_portfolio/modules/home/views/components/skills_section.dart';

class HomeWrapperMedium extends StatelessWidget {
  const HomeWrapperMedium({
    super.key,
    required this.goToWidgetByTag,
    required this.experienceKey,
    required this.projectsKey,
    required this.packagesKay,
    required this.blogKey,
    required this.skillsKey,
    required this.aboutMeKey,
    required this.state,
    required this.windowSizeResponsive,
  });

  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final GlobalKey packagesKay;
  final GlobalKey blogKey;
  final GlobalKey skillsKey;
  final GlobalKey aboutMeKey;
  final Function goToWidgetByTag;
  final PortfolioState state;
  final WindowSizeResponsive windowSizeResponsive;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProjectsSection(
            key: projectsKey,
            projects: state.projects,
            onTapWork: () => goToWidgetByTag(projectsKey),
            onTapAbout: () => goToWidgetByTag(aboutMeKey),
          ),
          PackagesSection(
            key: packagesKay,
            packages: state.packages,
          ),
          SkillsSection(
            key: skillsKey,
            skills: state.skills,
          ),
          ExperienceSection(
            key: experienceKey,
            experience: state.experiences,
          ),
          ArticlesScreen(
            key: blogKey,
            articles: state.articles,
          ),
          AboutMeSectionMedium(
            key: aboutMeKey,
            aboutMe: state.aboutMe!,
          ),
          FooterSection(
            aboutMe: state.aboutMe!,
            projects: state.projects,
            windowSizeResponsive: windowSizeResponsive,
          ),
        ],
      ),
    );
  }
}
