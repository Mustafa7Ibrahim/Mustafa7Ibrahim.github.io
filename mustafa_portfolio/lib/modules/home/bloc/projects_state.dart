part of 'portfolio_bloc.dart';

/// projects state
final class PortfolioState {
  /// projects state constructor
  const PortfolioState({
    this.status = PortfolioStatus.loading,
    this.aboutMe,
    this.articles = const [],
    this.experiences = const [],
    this.skills = const [],
    this.educations = const [],
    this.languages = const [],
    this.certifications = const [],
    this.projects = const [],
    this.packages = const [],
  });

  /// projects status
  final PortfolioStatus status;

  /// about me
  final AboutMe? aboutMe;

  /// articles
  final List<Article> articles;

  /// experiences
  final List<Experience> experiences;

  /// skills
  final List<String> skills;

  /// educations
  final List<Education> educations;

  /// languages
  final List<Language> languages;

  /// certifications
  final List<Certification> certifications;

  /// projects
  final List<Project> projects;

  /// packages
  final List<Package> packages;

  /// projects state copy with
  PortfolioState copyWith({
    PortfolioStatus? status,
    AboutMe? aboutMe,
    List<Article>? articles,
    List<Experience>? experiences,
    List<String>? skills,
    List<Education>? educations,
    List<Language>? languages,
    List<Certification>? certifications,
    List<Project>? projects,
    List<Package>? packages,
  }) {
    return PortfolioState(
      status: status ?? this.status,
      aboutMe: aboutMe ?? this.aboutMe,
      articles: articles ?? this.articles,
      experiences: experiences ?? this.experiences,
      skills: skills ?? this.skills,
      educations: educations ?? this.educations,
      languages: languages ?? this.languages,
      certifications: certifications ?? this.certifications,
      projects: projects ?? this.projects,
      packages: packages ?? this.packages,
    );
  }
}

/// projects status enum
/// Represents the status of the projects.
enum PortfolioStatus {
  /// Indicates that the projects are currently being loaded.
  loading,

  /// Indicates that the projects were loaded successfully.
  success,

  /// Indicates that there was a failure while loading the projects.
  failure,
}
