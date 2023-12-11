part of 'portfolio_bloc.dart';

/// projects state
final class PortfolioState {
  /// projects state constructor
  const PortfolioState({
    this.status = PortfolioStatus.loading,
    this.portfolio,
  });

  /// projects status
  final PortfolioStatus status;

  /// projects list
  final Portfolio? portfolio;

  /// projects state copy with
  PortfolioState copyWith({
    PortfolioStatus? status,
    Portfolio? portfolio,
  }) {
    return PortfolioState(
      status: status ?? this.status,
      portfolio: portfolio ?? this.portfolio,
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
