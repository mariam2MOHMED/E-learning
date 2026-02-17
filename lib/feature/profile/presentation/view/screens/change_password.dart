import 'package:elearning/core/di/di.dart';
import 'package:elearning/feature/profile/presentation/view/widgets/change_password_form.dart';
import 'package:elearning/feature/profile/presentation/view_model/change_password/change_password_cubit.dart';
import 'package:elearning/feature/profile/presentation/view_model/change_password/change_password_event.dart';
import 'package:elearning/feature/profile/presentation/view_model/change_password/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
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
          AppLocalizations.of(context)!.resetPassword,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16.0,
          vertical: 32,
        ),
        child: BlocProvider(
          create: (_) =>
              getIt<ChangePasswordCubit>()
                ..doIntent(intent: const ChangePasswordInitializationIntent()),
          child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state.changePasswordStatus.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                Text(AppLocalizations.of(context)!.updatePasswordSuccess)));
              }
              if (state.changePasswordStatus.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                Text(state.changePasswordStatus.error!.message)));
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  ChangePasswordForm(
                    oldPassword: context
                        .read<ChangePasswordCubit>()
                        .oldPassword,
                    newPassword: context
                        .read<ChangePasswordCubit>()
                        .newPassword,
                    confrimNewPassword: context
                        .read<ChangePasswordCubit>()
                        .confirmNewPassword,
                    formkey: context.read<ChangePasswordCubit>().formkey,
                    onChanged: (_) {
                      context.read<ChangePasswordCubit>().doIntent(
                        intent: const IsTypingPasswordIntent(),
                      );
                    },
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:state.isTyping?AppColors.blue: AppColors.black[40],
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)
                    ),
                    onPressed: state.isTyping
                        ? () {
                            context.read<ChangePasswordCubit>().doIntent(
                              intent: const ChangePasswordFormIntent(),
                            );
                          }
                        : null,
                    child: Text(AppLocalizations.of(context)!.update),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
