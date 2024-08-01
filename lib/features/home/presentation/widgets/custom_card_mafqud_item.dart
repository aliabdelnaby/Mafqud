import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/app_colors.dart';

class CustomCardMafqudItem extends StatelessWidget {
  const CustomCardMafqudItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://www.bishopandsewell.co.uk/wp-content/uploads/2019/08/Missing-Person-shutterstock_752963539-300x280.jpg",
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
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
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
