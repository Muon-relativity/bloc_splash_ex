import 'package:get_it/get_it.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerFactory(() => SplashBloc());
  sl.registerFactory(() => HomeBloc());
}
