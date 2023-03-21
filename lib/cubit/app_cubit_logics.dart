import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_finder_app/cubit/app_cubit_states.dart';
import 'package:school_finder_app/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../nav_pages/home_page.dart';
import '../nav_pages/main_page.dart';
import '../pages/detailed_page.dart';
import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is DetailState) {
            return DetailedPage();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return MainPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
