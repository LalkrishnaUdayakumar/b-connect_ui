import 'package:b_connect/app_provider.dart';
import 'package:b_connect/auth/forgot_password.dart';
import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/login_page.dart';
import 'package:b_connect/auth/signup_page.dart';
import 'package:b_connect/mainscreen/donor_details_screen.dart';
import 'package:b_connect/mainscreen/main_screen.dart';
import 'package:b_connect/token.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedToken = await TokenStorage.getToken();
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        final appProvider = AppProvider();

        // 🔹 If token exists, set it to provider (for runtime use)
        if (savedToken != null && savedToken.isNotEmpty) {
          appProvider.setBearerToken(savedToken);
        }

        return appProvider;
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/${HomePage.id}',
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              },
            ),
            GoRoute(
              path: '/${SignupPage.id}',
              builder: (BuildContext context, GoRouterState state) {
                return const SignupPage();
              },
            ),
            GoRoute(
              path: '/${LoginPage.id}',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginPage();
              },
            ),
            GoRoute(
              path: '/${ForgotPassword.id}',
              builder: (BuildContext context, GoRouterState state) {
                return const ForgotPassword();
              },
            ),
            GoRoute(
              path: '/${MainScreen.id}',
              builder: (BuildContext context, GoRouterState state) {
                return const MainScreen();
              },
            ),
            GoRoute(
              path: '/${DonorDetailsScreen.id}',
              builder: (BuildContext context, GoRouterState state) {
                return const DonorDetailsScreen();
              },
            ),
          ],
        ),
      ],
    );
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'B-Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
