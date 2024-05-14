import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_styles.dart';

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
    return const Scaffold(
      body: Center(
        child: Text(
          "Mafqud",
          style: CustomTextStyle.pacificoSplash,
        ),
      ),
    );
  }

  void delayedNavigate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        customReplacementNavigate(context, "/login");
      },
    );
  }
}
