import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My account'),
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            customPop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
