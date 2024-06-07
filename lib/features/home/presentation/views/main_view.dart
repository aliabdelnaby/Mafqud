import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';
import 'package:mafqud/features/home/presentation/cubit/home_cubit.dart';
import 'package:mafqud/features/home/presentation/views/home_view.dart';
import 'package:mafqud/features/home/presentation/widgets/custom_home_drawer.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<HomeCubit>().homekey,
      drawer: const CustomHomeDrawer(),
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
        leading: IconButton(
          onPressed: () {
            context.read<HomeCubit>().homekey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.primary,
            size: 34,
          ),
        ),
      ),
      body: const HomeView(),
    );
  }
}
