import 'package:elearning/core/di/di.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:elearning/feature/auth/presentation/view/widget/forget_password_header.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_intent.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/route/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key,
  //  required this.email
  });
//final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.gray,
            size: 20.0,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.password,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: BlocProvider(
          create: (context) =>
              getIt<ForgetPasswordCubit>()
                ..doIntent(intent: const ResetPasswordInitializationIntent()),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              final cubit = context.read<ForgetPasswordCubit>();
              return Form(
                key: cubit.resetPasswordForm,
                autovalidateMode: state.resetPasswordValidateMode,
                child: Column(
                  children: [
                    ForgetPasswordHeader(
                      title: AppLocalizations.of(context)!.resetPassword,
                      subTitle: AppLocalizations.of(
                        context,
                      )!.passwordValidation,
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      controller: cubit.newPassword,
                      validator: Validator.validatePassword,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enterPassword,
                        labelText: AppLocalizations.of(context)!.newPassword,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: cubit.confirmPassword,
                      validator: (_) => Validator.validateConfirmPassword(
                        cubit.confirmPassword.text,
                        cubit.newPassword.text,
                      ),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.enterConfirmPassword,
                        labelText: AppLocalizations.of(
                          context,
                        )!.confirmPassword,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      ),
                      onPressed: () {
                        cubit.doIntent(intent: const ResetPasswordFormIntent());
                      },
                      child: Text(AppLocalizations.of(context)!.continueWord),
                    ),
                  ],
                ),
              );
            },
            listener: (context, state) {
              if (state.resetPasswordRequest.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)!.passwordResetSuccessfully,
                    ),
                  ),
                );
                Navigator.of(context).pushNamed(
                    AppRoutes.resetPassword,
                //    arguments:email
                );
              }
              if (state.resetPasswordRequest.isFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.resetPasswordRequest.error!.message),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
