import 'package:flutter/material.dart';
import 'package:mafqud/core/function/navigation.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:mafqud/features/auth/presentation/widgets/custom_title_login_view.dart';
import 'package:mafqud/features/auth/presentation/widgets/have_an_account.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
              child:
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ),
            const SliverToBoxAdapter(child: CustomSignUpForm()),
            SliverToBoxAdapter(
              child:
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccount(
                onTap: () {
                  customReplacementNavigate(context, '/loginView');
                },
              ),
            ),
            SliverToBoxAdapter(
              child:
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
