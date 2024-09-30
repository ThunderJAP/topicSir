import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/config/theme_data/theme_data.dart';
import 'package:topik_sir/screens/dictionary/dictionary_view.dart';
import 'package:topik_sir/screens/exam/exams_main_view.dart';
import 'package:topik_sir/screens/exam/single_exam_view.dart';
import 'package:topik_sir/screens/grammar/grammer_main_view.dart';
import 'package:topik_sir/screens/home/home_view.dart';
import 'package:topik_sir/screens/login/login_view.dart';
import 'package:topik_sir/screens/signup/signup_view.dart';
import 'package:topik_sir/screens/splash/splash_screen.dart';
import 'package:topik_sir/screens/welcome/welcome_view.dart';
import 'package:topik_sir/services/provider_services/dashboard_service.dart';
import 'package:topik_sir/services/provider_services/dictionary_service.dart';
import 'package:topik_sir/services/provider_services/exam_service.dart';
import 'package:topik_sir/services/provider_services/grammer_service.dart';
import 'package:topik_sir/services/provider_services/home_service.dart';
import 'package:topik_sir/services/provider_services/leaderboard_service.dart';
import 'package:topik_sir/services/provider_services/login_service.dart';
import 'package:topik_sir/services/provider_services/signup_service.dart';
import 'package:topik_sir/services/provider_services/video_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginService()),
    ChangeNotifierProvider(create: (_) => HomeService()),
    ChangeNotifierProvider(create: (_) => DashBoardService()),
    ChangeNotifierProvider(create: (_) => SignUpService()),
    ChangeNotifierProvider(create: (_) => LoginService()),
    ChangeNotifierProvider(create: (_) => ExamService()),
    ChangeNotifierProvider(create: (_) => DictionaryService()),
    ChangeNotifierProvider(create: (_) => VideoService()),
    ChangeNotifierProvider(create: (_) => LeaderBoardService()),
    ChangeNotifierProvider(create: (_) => GrammarService()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UI.themeData(),
      // home: const ExamsMainView(),
      routes: {
        "/": (BuildContext context) => const SplashView(),
        "/welcome": (BuildContext context) => WelcomeView(),
        "/login": (BuildContext context) => const LoginView(),
        "/signUp": (BuildContext context) => const SignupView(),
        "/home": (BuildContext context) => const HomeView(),
        "/exam": (BuildContext context) => const ExamsMainView(),
        "/dictionary": (BuildContext context) => const DictionaryView(),
        "/grammar": (BuildContext context) => const GrammarMainView(),
      },
    );
  }
}
