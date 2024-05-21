import 'package:flutter/material.dart';
import 'package:mafqud/features/my_posts/widgets/custom_my_mafqud_card.dart';

class MyPostsView extends StatelessWidget {
  const MyPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const CustomMyMafqudCard();
          },
        ),
      ),
    );
  }
}
