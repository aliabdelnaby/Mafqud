import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.offWhite,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        children: [
          const SizedBox(height: 80),
          _buildDrawerHeader(),
          ..._buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      child: Text(
        "Mafqud",
        style: CustomTextStyle.pacificoSplash.copyWith(
          fontFamily: 'Pacifico',
          fontSize: 60,
        ),
      ),
    );
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    return [
      _buildDrawerItem(
        icon: Icons.home_filled,
        title: 'Home',
        onTap: () => customPop(context),
      ),
      _buildDrawerItem(
        icon: Icons.person,
        title: 'Profile',
        onTap: () => customNavigate(context, '/profileView'),
      ),
      _buildDrawerItem(
        icon: Icons.add_card_rounded,
        title: 'My Posts',
        onTap: () => customNavigate(context, '/myPostsView'),
      ),
      _buildDrawerItem(
        icon: Icons.settings,
        title: 'Settings',
        onTap: () => customNavigate(context, '/settingsView'),
      ),
    ];
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: CustomTextStyle.poppins300style16),
      onTap: onTap,
    );
  }
}
