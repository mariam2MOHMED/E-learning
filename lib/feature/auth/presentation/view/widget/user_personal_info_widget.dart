import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:flutter/material.dart';

class UserPersonalInfoWidget extends StatelessWidget {
  const UserPersonalInfoWidget({super.key, 
    required this.email, required this.password,
    required this.phone, required this.rePassword});
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController phone;
  final TextEditingController rePassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: email,
          validator: Validator.validateUsername,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enterEmail,


          ),
        ),
        const SizedBox(height: 16.0,),
        Row(
          children: [
            Expanded(child: TextFormField(
              controller: password,
              validator: Validator.validatePassword,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.enterPassword,

              ),
            ),),
            const SizedBox(width: 16.0,),
            Expanded(child:       TextFormField(
              controller: rePassword,
              validator: (_) => Validator.validateConfirmPassword(
                password.text,
                rePassword.text,
              ),              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.confirmPassword,
                hintText: AppLocalizations.of(context)!.enterConfirmPassword,

              ),
            ),)
          ],
        ),
        const SizedBox(height: 16.0,),

        TextFormField(
          controller: phone,
          validator: Validator.validatePhoneNumber,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.phoneNumber,
            hintText: AppLocalizations.of(context)!.enterPhoneNumber,


          ),
        ),
      ],
    );
  }
}
