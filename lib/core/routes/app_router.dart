import 'package:go_router/go_router.dart';
import 'package:mafqud/features/auth/presentation/views/login_view.dart';
import 'package:mafqud/features/auth/presentation/views/sign_up_view.dart';
import 'package:mafqud/features/home/home_view.dart';
import 'package:mafqud/features/splash/splash.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => const SplashView()),
    ),
    GoRoute(
      path: '/login',
      builder: ((context, state) => const LoginView()),
    ),
    GoRoute(
      path: '/signUp',
      builder: ((context, state) => const SignUpView()),
    ),
    GoRoute(
      path: '/home',
      builder: ((context, state) => const HomeView()),
    ),
  ],
);
