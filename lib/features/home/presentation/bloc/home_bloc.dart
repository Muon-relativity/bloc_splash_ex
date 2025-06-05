import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<InitializeTabs>(_onInitializeTabs);
    add(InitializeTabs());
  }

  Future<void> _onInitializeTabs(InitializeTabs event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await Future.delayed(Duration(milliseconds: 500));
    emit(HomeLoaded(['Tab 1', 'Tab 2', 'Tab 3']));
  }
}
