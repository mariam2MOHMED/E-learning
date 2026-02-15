import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
   const UserInfoWidget({super.key, required this.userName, this.onChanged,
     required this.firstName, required this.lastName});
final TextEditingController userName;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
TextFormField(
  controller: userName,
  validator: Validator.validateUsername,
  onChanged:onChanged ,
  decoration: InputDecoration(
    labelText: AppLocalizations.of(context)!.username,
    hintText: AppLocalizations.of(context)!.enterUsername,


  ),
),
        const SizedBox(height: 16.0,),
        Row(
          children: [
            Expanded(child: TextFormField(
              controller: firstName,
              onChanged:onChanged ,
              validator: Validator.validateFullName,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.firstName,
                hintText: AppLocalizations.of(context)!.enterFirstName,

              ),
            ),),
            const SizedBox(width: 16.0,),
      Expanded(child:       TextFormField(
        controller: lastName,
        onChanged:onChanged ,
        validator: Validator.validateFullName,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.lastName,
          hintText: AppLocalizations.of(context)!.enterLastName,

        ),
      ),)
          ],
        )
      ],
    );
  }
}
