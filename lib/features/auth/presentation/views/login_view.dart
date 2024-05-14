import 'package:flutter/material.dart';
import '../widgets/custom_forgot_and_create_account_text.dart';
import '../widgets/custom_login_form.dart';
import '../widgets/custom_title_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
            ),
            const SliverToBoxAdapter(
              child: CustomTitleLoginView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
            ),
            const SliverToBoxAdapter(
              child: CustomLoginForm(),
            ),
            const SliverToBoxAdapter(
              child: CustomForgotPassWordAndCreateAccountText(),
            ),
          ],
        ),
      ),
    );
  }
}
