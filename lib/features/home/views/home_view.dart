import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/features/add_post/views/add_post_view.dart';
import 'package:mafqud/features/home/widgets/custom_card_mafqud_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customNavigate(context, '/addPostView');
        },
        tooltip: "Add Post",
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add_card_rounded,
          color: AppColors.white,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 90, bottom: 10, left: 15),
              child: CustomDropDownList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CustomCardMafqudItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
