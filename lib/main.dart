import 'package:fasn/pages/app_page/main_page.dart';
import 'package:fasn/pages/aunth_page/mainWidgets/login_page.dart';
import 'package:fasn/pages/aunth_page/mainWidgets/reg_page.dart';
import 'package:fasn/pages/aunth_page/mainWidgets/reset_page.dart';
import 'package:flutter/material.dart';
import 'package:fasn/pages/aunth_page/mainWidgets/start_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var supabaseUrl = dotenv.env["SUPABASE_URL"];
var supabaseKey = dotenv.env["SUPABASE_KEY"];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
      url: supabaseUrl as String, anonKey: supabaseKey as String);
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      })),
      title: 'Fasn',
      initialRoute:
          supabase.auth.currentSession != null ? '/accountRoute' : '/',
      routes: {
        '/': (context) => StartScreen(),
        '/registrationRoute': (context) => RegScreen(),
        '/accountRoute': (context) => MainAppScreen(),
        '/loginRoute': (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
