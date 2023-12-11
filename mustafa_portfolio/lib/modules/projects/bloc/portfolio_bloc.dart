import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa_portfolio/core/core_data/my_data.dart';
import 'package:mustafa_portfolio/core/core_data/my_data_model.dart';

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

  Future<void> _loadProjects(Emitter<PortfolioState> emit) async {
    emit(state.copyWith(status: PortfolioStatus.loading));
    final data = Portfolio.fromJson(myData);
    emit(
      state.copyWith(
        status: PortfolioStatus.success,
        portfolio: data,
      ),
    );
  }
}
