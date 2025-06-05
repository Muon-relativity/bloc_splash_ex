import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return Scaffold(
              appBar: AppBar(title: Text('홈 화면')),
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is HomeLoaded) {
            final tabs = state.tabs;

            return DefaultTabController(
              length: tabs.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('홈 화면'),
                  bottom: TabBar(
                    tabs: tabs.map((t) => Tab(text: t)).toList(),
                  ),
                ),
                body: TabBarView(
                  children: tabs.map((t) => Center(child: Text('$t 콘텐츠'))).toList(),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
