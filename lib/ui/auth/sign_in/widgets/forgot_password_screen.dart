import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nextmind_mobile/ui/auth/sign_in/view_models/forgot_password_viewmodel.dart';
import 'package:nextmind_mobile/ui/core/themes/dimens.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordViewModel viewModel = Get.find();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text('forgotPassword'.tr),
            centerTitle: true,
          ),
          SliverPadding(
              padding: EdgeInsets.all(Dimens.largePadding),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                SvgPicture.asset(
                  'assets/images/forgot_password.svg',
                  height: 250,
                ),
                SizedBox(height: Dimens.largePadding),
                Form(
                  key: viewModel.formKey,
                  child: TextFormField(
                    controller: viewModel.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'fieldNotEmpty'.tr;
                      }
                      if (!viewModel.isValidEmail(value)) {
                        return 'fieldEmailInvalid'.tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'fieldHintTextEmail'.tr,
                    ),
                  ),
                ),
                SizedBox(height: Dimens.largePadding),
                ElevatedButton(
                  onPressed: () {
                    if (viewModel.formKey.currentState!.validate()) {
                      viewModel.sendEmailCommand.execute();
                    }
                  },
                  child: Text('fieldSendButton'.tr),
                ),
              ]))),
        ],
      ),
    );
  }
}
