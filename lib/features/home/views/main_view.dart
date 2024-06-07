import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';
import 'package:mafqud/features/home/views/home_view.dart';
import 'package:mafqud/features/my_posts/views/my_post_view.dart';
import 'package:mafqud/features/profile/views/profile_view.dart';
import 'package:mafqud/features/settings/views/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> key = GlobalKey();

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ProfileView(),
    MyPostsView(),
    SettingsView(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: Drawer(
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
                Navigator.pop(context);
                _onItemTapped(0);
              },
              trailing: _selectedIndex == 0
                  ? const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: AppColors.primary,
                    )
                  : null,
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
                Navigator.pop(context);
                _onItemTapped(1);
              },
              trailing: _selectedIndex == 1
                  ? const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: AppColors.primary,
                    )
                  : null,
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
                Navigator.pop(context);
                _onItemTapped(2);
              },
              trailing: _selectedIndex == 2
                  ? const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: AppColors.primary,
                    )
                  : null,
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
                Navigator.pop(context);
                _onItemTapped(3);
              },
              trailing: _selectedIndex == 3
                  ? const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: AppColors.primary,
                    )
                  : null,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Mafqud',
          style: CustomTextStyle.pacificoSplash.copyWith(
            fontSize: 28,
            fontFamily: "Pacifico",
          ),
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
        leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.primary,
            size: 38,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
