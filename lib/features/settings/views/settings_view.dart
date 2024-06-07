import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/app_styles.dart';
import 'package:mafqud/features/settings/widgets/custom_settings_list_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onTap: () {},
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
