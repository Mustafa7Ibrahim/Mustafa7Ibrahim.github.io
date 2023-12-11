part of 'portfolio_bloc.dart';

/// project events are the actions that can be done on the projects screen
@immutable
sealed class PortfolioEvent {
  /// projects event constructor
  const PortfolioEvent();
}

/// this event is used to load the projects data
class LoadPortfolioEvent extends PortfolioEvent {
  /// load projects event constructor
  const LoadPortfolioEvent();
}
