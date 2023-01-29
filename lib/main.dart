import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contest/app/view/app.dart';
import 'package:flutter_contest/data/services/hive/country_hive/models/country_hive_model.dart';
import 'package:flutter_contest/data/services/hive/file_hive/models/file_hive_model.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/utils/constants/hive_keys.dart';
import 'package:flutter_contest/presentation/utils/extensions/device_id_extension.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing Firebase
  await Firebase.initializeApp();

  // Initializing Hive && Storage Service
  await Hive.initFlutter();
  Hive.registerAdapter(CountryHiveModelAdapter());
  Hive.registerAdapter(FileHiveModelAdapter());
  await Hive.openBox<CountryHiveModel>(HiveKeys.countryBox);
  await Hive.openBox<FileHiveModel>(HiveKeys.downloadedFilesBox);

  // Setting portrait view on app && white status bar
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorConst.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(App());
}
