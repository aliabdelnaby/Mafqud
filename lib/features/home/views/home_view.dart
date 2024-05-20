import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/core/utils/app_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.primary,
            size: 38,
          ),
        ),
      ),
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
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const CustomCardMafqudItem();
          },
        ),
      ),
    );
  }
}

class CustomCardMafqudItem extends StatelessWidget {
  const CustomCardMafqudItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.49,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECF0FF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://www.bishopandsewell.co.uk/wp-content/uploads/2019/08/Missing-Person-shutterstock_752963539-300x280.jpg",
                height: MediaQuery.of(context).size.height * 0.23,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              "Name: علي ",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text(
              "Age: 25",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text(
              "Governorate: القاهرة",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Contact number: 01224863876 ",
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.call,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text(
              "Last seen: شارع صلاح سالم 10 مساء",
            ),
          ],
        ),
      ),
    );
  }
}
