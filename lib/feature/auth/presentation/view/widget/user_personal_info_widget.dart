import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:flutter/material.dart';

class UserPersonalInfoWidget extends StatelessWidget {
   UserPersonalInfoWidget({super.key,
    required this.email, required this.password,
    required this.phone, required this.rePassword,this.onChanged});
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController phone;
  final TextEditingController rePassword;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: email,
          onChanged: onChanged,
          validator: Validator.validateEmail,
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
              onChanged: onChanged,

              validator: Validator.validatePassword,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.enterPassword,

              ),
            ),),
            const SizedBox(width: 16.0,),
            Expanded(child:       TextFormField(
              controller: rePassword,
              onChanged: onChanged,

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
          onChanged: onChanged,

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
