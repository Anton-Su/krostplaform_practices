import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_1/Di/di.dart';
import 'package:practice_1/pages/loading_page.dart';
import 'package:practice_1/pages/login_page.dart';
import 'package:practice_1/pages/myHomePage/block/my_home/my_home_bloc.dart';
import 'package:practice_1/pages/myHomePage/my_home_page.dart';
import 'package:practice_1/pages/profile_page.dart';
import 'package:practice_1/pages/register_page.dart';
import 'package:practice_1/pages/detail_page.dart';
import 'package:practice_1/routes.dart';
import 'package:practice_1/theme/app_theme.dart';
import 'package:practice_1/theme/theme_cubit.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Получаем ThemeCubit из DI
      create: (_) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: '/',
            theme: AppTheme.light, // светлая тема
            darkTheme: AppTheme.dark,// темная тема
            themeMode: themeMode, // сюда передаем состояние Cubit
            routes: {
              // Главный экран
              Routes.loading: (context) =>
                  const LoadingPage(title: 'The Antoha MarketPlace'),
              Routes.info: (context) => BlocProvider(
                create: (_) =>
                    getIt<MyHomeBloc>()..add(const LoadPositionsEvent()),
                child: const MyHomePage(title: 'The Antoha MarketPlace'),
              ),
              Routes.login: (context) => const LoginPage(),
              Routes.profile: (context) => const ProfilePage(),
              Routes.register: (context) => const RegisterPage(),
            },
            onGenerateRoute: (routeSettings) {
              final path = routeSettings.name?.split('/');
              if (path == null || path.length < 3) {
                return null;
              }
              if (path[1] == Routes.details.split("/")[1]) {
                return MaterialPageRoute(
                  builder: (context) => DetailPage(id: int.parse(path[2])),
                  settings: routeSettings,
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
