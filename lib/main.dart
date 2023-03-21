import 'package:school_finder_app/cubit/app_cubit_logics.dart';
import 'package:school_finder_app/cubit/app_cubits.dart';
import 'package:school_finder_app/nav_pages/main_page.dart';
import 'package:school_finder_app/pages/detailed_page.dart';
import 'package:school_finder_app/pages/services/data_services.dart';
import 'package:school_finder_app/pages/welcome_page.dart';
import 'package:school_finder_app/widgets/app_large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'nav_pages/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'School Finder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(
            data: DataServices(),
          ),
          child: AppCubitLogics(),
        ));
  }
}
