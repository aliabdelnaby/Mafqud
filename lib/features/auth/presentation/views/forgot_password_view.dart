import 'package:flutter/material.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_reset_password_form.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_title_login_view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            ),
            const SliverToBoxAdapter(child: CustomTitleLoginView()),
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            ),
            const SliverToBoxAdapter(child: CustomResetPasswordForm()),
          ],
        ),
      ),
    );
  }
}
