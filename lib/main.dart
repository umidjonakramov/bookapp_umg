import 'package:bookapp_umg/presentation/screens/dashboard/dashboard.dart';
import 'package:bookapp_umg/presentation/screens/dashboard/dashboard_bloc.dart';
import 'package:bookapp_umg/presentation/screens/login/login_bloc.dart';
import 'package:bookapp_umg/presentation/screens/login/login.dart';
import 'package:bookapp_umg/presentation/screens/play/play_bloc.dart';
import 'package:bookapp_umg/presentation/screens/play/play.dart';
import 'package:bookapp_umg/presentation/screens/register/register_bloc.dart';
import 'package:bookapp_umg/presentation/screens/register/register.dart';
import 'package:bookapp_umg/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/source/local/my_preference.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  MyPreference.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AudioBook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => const SplashScreen(),
        'login': (BuildContext context) => BlocProvider(
          create: (BuildContext context) => LoginBloc(),
          child: const LoginScreen(),
        ),
        'register': (BuildContext context) => BlocProvider(
          create: (BuildContext context) => RegisterBloc(),
          child: const RegisterScreen(),
        ),
        'main' : (BuildContext context) => BlocProvider(
          create: (BuildContext context) => MainBloc(),
          child: const MainScreen(),
        ),
        'play' : (BuildContext context) => BlocProvider(
          create: (BuildContext context) => PlayBloc(),
          child: const PlayScreen(),
        ),

      },
    );
  }
}