import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(40)
            ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppColors.lightGrey),
          ),

       hintText: AppLocalizations.of(context)!.search,
        prefixIcon: const Icon(Icons.search,
          color: AppColors.lightGrey,)
      ),
    );
  }
}
