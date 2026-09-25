import 'package:flutter/material.dart';
import 'package:practice_1/pages/loading_page.dart';
import 'package:practice_1/pages/login_page.dart';
import 'package:practice_1/pages/myHome_page.dart';
import 'package:practice_1/pages/profile_page.dart';
import 'package:practice_1/pages/register_page.dart';
import 'package:practice_1/pages/detail_page.dart';
import 'package:practice_1/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        // Главный экран
        Routes.loading: (context) => const LoadingPage(title: 'The Antoha MarketPlace'),
        Routes.info: (context) => const MyHomePage(title: 'The Antoha MarketPlace'),
        Routes.login: (context) => const LoginPage(),
        Routes.profile: (context) => const ProfilePage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.details: (context) => const DetailPage(title: 'Test',),
      },
      onGenerateRoute: (routeSettings) {
        final path = routeSettings.name?.split('/');
        if (path == null || path.length < 3) {
          return null;
        }
        if (path[1] == Routes.details.split("/")[1]) {
          return MaterialPageRoute(
            builder: (context) => DetailPage(title: path[2]),
            settings: routeSettings,
          );
        }
        return null;
      },
    );
  }
}