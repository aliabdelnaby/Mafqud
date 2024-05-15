import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';

import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/home_view.dart';
import '../../features/splash/splash.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => const SplashView()),
    ),
    GoRoute(
      path: '/loginView',
      builder: ((context, state) => const LoginView()),
    ),
    GoRoute(
      path: '/signUpview',
      builder: ((context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          )),
    ),
    GoRoute(
      path: '/homeView',
      builder: ((context, state) => const HomeView()),
    ),
    GoRoute(
      path: '/forgotPasswordView',
      builder: ((context, state) => const ForgotPasswordView()),
    ),
  ],
);
