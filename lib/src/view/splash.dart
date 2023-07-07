import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData themeData;
  @override
  void initState() {
    super.initState();
    navigation();
  }

  navigation() async {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: themeData.colorScheme.background,
          body: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://w7.pngwing.com/pngs/185/850/png-transparent-task-computer-icons-tasks-s-angle-text-microsoft-office-thumbnail.png",
                      width: 300,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Task By",
                      style: AppTheme.getTextStyle(
                        fontSize: 16,
                        fontWeight: 500,
                        color: themeData.colorScheme.inversePrimary,
                      ),
                    ),
                    Text(
                      "Karthikeyan SK",
                      style: AppTheme.getTextStyle(
                        fontSize: 20,
                        fontWeight: 800,
                        color: themeData.colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
