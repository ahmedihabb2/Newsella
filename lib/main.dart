import 'package:flutter/material.dart';
import 'package:news_application/Screens/WelcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/HomeScreen.dart';
import 'Utilities/ThemeData.dart';
void main() async{
  //Due To Flutter Update we need to type this line when we use async in main
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen ;
  if(seen == null || seen==false)
    {
      _screen = WelcomePage();
    }
  else{
    _screen = HomeScreen();
  }
  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screen ,
      theme: AppTheme.apptheme,
    );
  }
}
