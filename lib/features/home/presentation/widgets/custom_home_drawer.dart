import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.offWhite,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        children: [
          const SizedBox(height: 80),
          DrawerHeader(
            child: Text(
              "Mafqud",
              style: CustomTextStyle.pacificoSplash.copyWith(
                fontFamily: 'Pacifico',
                fontSize: 60,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_filled,
              color: AppColors.primary,
            ),
            title: const Text(
              'Home',
              style: CustomTextStyle.poppins300style16,
            ),
            onTap: () {
              customPop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: AppColors.primary,
            ),
            title: const Text(
              'Profile',
              style: CustomTextStyle.poppins300style16,
            ),
            onTap: () {
              customNavigate(context, '/profileView');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add_card_rounded,
              color: AppColors.primary,
            ),
            title: const Text(
              'My Posts',
              style: CustomTextStyle.poppins300style16,
            ),
            onTap: () {
              customNavigate(context, '/myPostsView');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: AppColors.primary,
            ),
            title: const Text(
              'Settings',
              style: CustomTextStyle.poppins300style16,
            ),
            onTap: () {
              customNavigate(context, '/settingsView');
            },
          ),
        ],
      ),
    );
  }
}
