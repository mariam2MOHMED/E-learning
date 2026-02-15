import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/core/theme/fonts_manager.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:flutter/material.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    super.key,
    required this.emailController,
    required this.phoneController,
  });

  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        TextFormField(
          controller: emailController,
          validator: Validator.validateEmail,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterEmail,
            labelText: AppLocalizations.of(context)!.email,
          ),
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          obscureText: true,
          obscuringCharacter: "⭐",
          controller: TextEditingController(text: "mariamj"),
          validator: Validator.validatePassword,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterPassword,
            labelText: AppLocalizations.of(context)!.password,
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Text(
                    AppLocalizations.of(context)!.change,
                    style: const TextStyle(
                      fontSize: FontSize.s16,
                      color: AppColors.primaryBlue,

                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterPhoneNumber,
            labelText: AppLocalizations.of(context)!.phoneNumber,
          ),
          validator: Validator.validatePhoneNumber,
        ),
      ],
    );
  }
}
