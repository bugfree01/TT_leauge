// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_league/screen/customWidget/singupLoadingPicScreen.dart';

import 'helper/app_utilities/app_theme.dart';
import 'helper/routeAndBlocManager/blocProvider.dart';
import 'screen/authentication/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    // initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
      providers: BlocManager.blocProviders,
      child: MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: defaultAppThemeData,
        // home: SinupLoadingPics(),
        home: SplashScreen(),
      ),
    );
  }
}

