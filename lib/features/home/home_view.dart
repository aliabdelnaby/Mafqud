import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mafqud',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              customReplacementNavigate(context, '/loginView');
              await FirebaseAuth.instance.signOut();
              
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: const Column(),
    );
  }
}
