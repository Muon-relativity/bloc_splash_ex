import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_ex/features/splash/presentation/bloc/splash_event.dart';
import 'package:splash_ex/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitializeApp>(_onInitializeApp);
    add(InitializeApp()); // Bloc 생성 시 자동 실행
  }

  Future<void> _onInitializeApp(InitializeApp event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(Duration(seconds: 5));
    emit(SplashLoaded());
  }
}
