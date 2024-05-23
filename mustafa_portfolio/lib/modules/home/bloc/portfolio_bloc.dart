import 'package:bloc/bloc.dart';
import 'package:mustafa_portfolio/core/core_data/about_me_model.dart';
import 'package:mustafa_portfolio/core/core_data/article_model.dart';
import 'package:mustafa_portfolio/core/core_data/certification_model.dart';
import 'package:mustafa_portfolio/core/core_data/education_model.dart';
import 'package:mustafa_portfolio/core/core_data/experience_model.dart';
import 'package:mustafa_portfolio/core/core_data/language_model.dart';
import 'package:mustafa_portfolio/core/core_data/packages_model.dart';
import 'package:mustafa_portfolio/core/core_data/project_model.dart';
import 'package:mustafa_portfolio/modules/home/repository/data_repository.dart';

part 'portfolio_event.dart';
part 'projects_state.dart';

/// projects bloc
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  /// projects bloc constructor
  PortfolioBloc() : super(const PortfolioState()) {
    on<PortfolioEvent>(
      (event, emit) async {
        switch (event) {
          case LoadPortfolioEvent():
            await _loadProjects(emit);
        }
      },
    );
  }

  /// data repository
  final dataRepo = DataRepository();

  Future<void> _loadProjects(Emitter<PortfolioState> emit) async {
    emit(state.copyWith(status: PortfolioStatus.loading));
    final aboutMe = await dataRepo.getAboutMe();
    final articles = await dataRepo.getArticles();
    final experiences = await dataRepo.getExperiences();
    final skills = await dataRepo.getSkills();
    final educations = await dataRepo.getEducations();
    final languages = await dataRepo.getLanguages();
    final certifications = await dataRepo.getCertifications();
    final projects = await dataRepo.getProjects();
    final packages = await dataRepo.getPackages();

    // final data = Portfolio.fromJson(myData);
    emit(
      state.copyWith(
        status: PortfolioStatus.success,
        aboutMe: aboutMe,
        articles: articles,
        experiences: experiences,
        skills: skills,
        educations: educations,
        languages: languages,
        certifications: certifications,
        projects: projects,
        packages: packages,
      ),
    );
  }
}
