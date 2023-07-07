import 'package:flutter/material.dart';

import 'package:interview/src/businesslogic/userList/user_get_data_bloc.dart';
import 'package:interview/src/businesslogic/user_detail/user_detail_bloc.dart';
import 'package:interview/src/repo/repo.dart';
import 'package:interview/src/view/splash.dart';
import 'package:interview/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserGetDataBloc>(
          create: (BuildContext context) => UserGetDataBloc(DioClient()),
        ),
        BlocProvider<UserDetailBloc>(
          create: (BuildContext context) => UserDetailBloc(DioClient()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme().init(context);
    return MaterialApp(
      title: 'Interview User Data',
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      home: const SplashScreen(),
    );
  }
}
