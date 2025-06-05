import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/di/service_locator.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashBloc>(),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          if (state is SplashLoading || state is SplashInitial) {
            return Scaffold(
              body: Center(
                child: Lottie.asset(
                  'assets/animations/splash_animation.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            );
          } else if (state is SplashLoaded) {
            return HomePage();
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
