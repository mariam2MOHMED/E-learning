import 'package:elearning/core/di/di.dart';
import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_intent.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../widget/forget_password_header.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key,
  //  required this.email
  });
  //final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.gray,
            size: 20.0,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.password,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium,
        ),
      ),
      body: Padding(padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16.0,
        vertical: 32.0,
      ), child:
      BlocProvider(create: (_) =>
      getIt<ForgetPasswordCubit>()
        ..doIntent(intent: const VerifyCodeInitializationIntent()),
        child: Column(
          children: [
            ForgetPasswordHeader(
              title: AppLocalizations.of(context)!.emailVerification,
              subTitle: AppLocalizations.of(context)!.enterVerificationCode,
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                    listener: (context, state) {
                      if (state.resetCodeRequest.isSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(AppLocalizations.of(context)!.emailSentSuccessfully)));
   Navigator.of(context).pushNamed(AppRoutes.resetPassword,
   //    arguments: email
   );
                     
                     
                     
                     
                      }
                      if (state.resetCodeRequest.isFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content:
                        Text(AppLocalizations.of(context)!.invalidCode)));
                      }
                    },
                    builder:
                        (context, state) {
                      final cubit = context.read<ForgetPasswordCubit>();
                      return PinCodeTextField(
                        errorBorderColor: AppColors.red,
                        autofocus: true,
                        wrapAlignment: WrapAlignment.center,
                        keyboardType: TextInputType.number,
                        controller: cubit.resetCode,
                        pinTextStyle: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                        pinBoxColor: AppColors.lightPrimaryBlue,
                        defaultBorderColor: AppColors.lightPrimaryBlue,
                        onDone: (_) {
                          context.read<ForgetPasswordCubit>().doIntent(intent:
                          const VerifyCodeIntent());
                        },
                        pinBoxWidth: 50,

                        onTextChanged: (_) {

                        },

                        pinBoxRadius: 10.0,
                        pinBoxHeight: 68.0,
                        maxLength: 6,
                      );
                    })
              ],
            )

          ],

        ),
      )),
    );
  }
}
