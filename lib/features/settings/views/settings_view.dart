import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';
import 'package:mafqud/features/settings/widgets/custom_settings_list_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Main options",
              style: CustomTextStyle.poppins400style15
                  .copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          CustomSettingsListTile(
            onTap: () {},
            title: "My account",
            icon: Icons.person_outline,
          ),
          const Divider(endIndent: 15, indent: 15),
          CustomSettingsListTile(
            onTap: () {},
            title: "Language",
            icon: Icons.language,
          ),
          const Divider(endIndent: 15, indent: 15),
          CustomSettingsListTile(
            onTap: () {},
            title: "About us",
            icon: Icons.info_outline,
          ),
          const Divider(endIndent: 15, indent: 15),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "More options",
              style: CustomTextStyle.poppins400style15
                  .copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          CustomSettingsListTile(
            onTap: () async {
              GoRouter.of(context).go('/loginView');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Logged out successfully"),
                  backgroundColor: AppColors.primary,
                ),
              );
              await FirebaseAuth.instance.signOut();
            },
            title: "Sign out",
            icon: Icons.logout_outlined,
          ),
          const Divider(endIndent: 15, indent: 15),
          CustomSettingsListTile(
            onTap: () {},
            title: "Delete account",
            icon: Icons.delete_forever_outlined,
          ),
          const Divider(endIndent: 15, indent: 15),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          const Text(
            "Version 1.0.0",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
