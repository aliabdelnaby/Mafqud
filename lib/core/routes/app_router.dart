import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/features/add_post/views/add_post_view.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';
import 'package:mafqud/features/home/presentation/cubit/home_cubit.dart';
import 'package:mafqud/features/my_posts/views/my_post_view.dart';
import 'package:mafqud/features/profile/views/profile_view.dart';
import 'package:mafqud/features/settings/views/settings_view.dart';

import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/views/main_view.dart';
import '../../features/splash/splash.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => const SplashView()),
    ),
    GoRoute(
      path: '/loginView',
      builder: ((context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          )),
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
      builder: ((context, state) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const MainView(),
          )),
    ),
    GoRoute(
      path: '/forgotPasswordView',
      builder: ((context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgotPasswordView(),
          )),
    ),
    GoRoute(
      path: '/addPostView',
      builder: ((context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const AddPostView(),
          )),
    ),
    GoRoute(
      path: '/profileView',
      builder: ((context, state) => const ProfileView()),
    ),
    GoRoute(
      path: '/myPostsView',
      builder: ((context, state) => const MyPostsView()),
    ),
    GoRoute(
      path: '/settingsView',
      builder: ((context, state) => const SettingsView()),
    ),
  ],
);
