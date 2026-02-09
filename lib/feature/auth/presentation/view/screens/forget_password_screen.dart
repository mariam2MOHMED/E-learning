import 'package:elearning/core/di/di.dart';
import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_intent.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/forget_password_header.dart';
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child:
   BlocProvider(create:(_)=>
       getIt<ForgetPasswordCubit>()..
       doIntent(intent: const ForgetPasswordInitializationIntent()),
     child:
BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(builder: (context,state){
  final cubit=context.read<ForgetPasswordCubit>();
  return
 Form(
     key: cubit.forgetPassForm,
autovalidateMode: state.autoValidateMode,
     child:    Column(
   children: [
      ForgetPasswordHeader(
       title: AppLocalizations.of(context)!.forgotPassword,
        subTitle: AppLocalizations.of(context)!.enterEmailSentence,
     ),
     const SizedBox(height: 32.0),
     TextFormField(
       controller:cubit.emailController,
       validator: Validator.validateEmail,
       onChanged: (_) {
         cubit.doIntent(intent: const IsEmailTypedIntent());
       },
       decoration: InputDecoration(
         hintText: AppLocalizations.of(context)!.enterEmail,
         labelText: AppLocalizations.of(context)!.email,
       ),
     ),
     const SizedBox(height: 32.0),

     ElevatedButton(
       style: ElevatedButton.styleFrom(
         backgroundColor:state.isEmailTyping? AppColors.blue:AppColors.lightGrey,
         fixedSize: Size(MediaQuery.of(context).size.width, 50),
       ),
       onPressed: state.isEmailTyping==true?() {
         cubit.doIntent(intent: const ForgetPasswordFormIntent());
       }:null,
       child: Text(AppLocalizations.of(context)!.continueWord),
     ),
   ],
 ));
}, listener: (context,state){
  if(state.forgetPasswordRequest.isSuccess){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(AppLocalizations.of(context)!.emailSentSuccessfully)));
 Navigator.of(context).pushNamed(AppRoutes.verifyPassword);
  }
  if(state.forgetPasswordRequest.isFailure){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(state.forgetPasswordRequest.error!.message)));
  }

})
     ,)
      ),
    );
  }
}
