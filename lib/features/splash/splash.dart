import 'package:flutter/material.dart';
import '../../core/function/navigation.dart';
import '../../core/utils/app_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Mafqud",
          style: CustomTextStyle.pacificoSplash.copyWith(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
    );
  }

  void delayedNavigate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        customReplacementNavigate(context, "/loginView");
      },
    );
  }
}
