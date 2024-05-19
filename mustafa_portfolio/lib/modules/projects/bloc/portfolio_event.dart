part of 'portfolio_bloc.dart';

/// project events are the actions that can be done on the projects screen
sealed class PortfolioEvent {
  /// projects event constructor
  const PortfolioEvent();
}

/// fetch main data event
/// that will return all of
/// - experiences
/// - skills
/// - educations
/// - languages
/// - certifications
/// - projects
/// - articles
/// - about me
class LoadPortfolioEvent extends PortfolioEvent {
  /// fetch main data event constructor
  const LoadPortfolioEvent();
}
