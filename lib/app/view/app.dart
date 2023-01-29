import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/router/app_router.dart';
import 'package:flutter_contest/presentation/views/tab/tab_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabScreen(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
