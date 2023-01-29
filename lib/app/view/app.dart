import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contest/app/cubit/app_cubit.dart';
import 'package:flutter_contest/presentation/router/app_router.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_contest/presentation/views/no_internet/no_internet_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tab_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..checkInternet(),
      child: ScreenUtilInit(
        designSize: const Size(375, 880),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.orange,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: RouteNames.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state.result == ConnectivityResult.none) {
          return const NoInternetScreen();
        } else {
          return const TabScreen();
        }
      },
    );
  }
}
