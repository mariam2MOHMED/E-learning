import 'package:elearning/core/di/di.dart';
import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/feature/auth/presentation/view/widget/remember_me_section.dart';
import 'package:elearning/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:elearning/feature/auth/presentation/view_model/login/login_event.dart';
import 'package:elearning/feature/auth/presentation/view_model/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/validators/validator.dart';
import '../widget/have_account_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          AppLocalizations.of(context)!.login,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    body: Padding(padding: const EdgeInsetsDirectional.symmetric(
      horizontal: 16.0,
      vertical: 32.0,
    ),child: 
BlocProvider(create: (_)=>getIt<LoginCubit>()..doIntent(
    intent: const LoginInitializationIntent()),child:
BlocConsumer<LoginCubit,LoginState>(builder: (context,state){
  final cubit=context.read<LoginCubit>();
  return Form(

key: cubit.formKey,
    autovalidateMode: state.autovalidateMode,
    child:   Column(
      children: [
        TextFormField(
          controller: cubit.emailController,
          onChanged: (_){
            cubit.doIntent(intent: const IsTypingIntent());

          },
          validator: Validator.validateEmail,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterEmail,
            labelText: AppLocalizations.of(context)!.email,
          ),
        ),
        const SizedBox(height: 16.0,),
        TextFormField(
          controller: cubit.passwordController,
onChanged: (_){
  cubit.doIntent(intent: const IsTypingIntent());

},
          validator: Validator.validatePassword,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterPassword,
            labelText: AppLocalizations.of(context)!.password,
          ),
        ),
        const SizedBox(height: 16.0,),
        RememberMeSection(value: state.isRemember,
          onChanged: (value){
          cubit.doIntent(intent: const IsRememberIntent());
          },),
        const SizedBox(height: 32.0,),
        ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: state.isTyping?AppColors.blue:
              AppColors.black[40],
                fixedSize: Size(MediaQuery.of(context).size.width, 50)
            ) ,
            onPressed:state.isTyping? (){
              cubit.doIntent(intent: const LoginFormIntent());
            }:null,
            child: Text( AppLocalizations.of(context)!.login)),
        const SizedBox(height: 21.0),
        HaveAccountSection(
            onEnter: (){
              Navigator.of(context).pushNamed(AppRoutes.register);
            },
            title: AppLocalizations.of(context)!
            .dontHaveAccount, subTitle: AppLocalizations.of(context)!.signUp)
      ],
    ),
  );
}, listener: (context,state){
  if (state.loginRequest.isSuccess){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.loginSuccess)));

  }
  if (state.loginRequest.isFailure){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.loginRequest.error!.message)));
  }
})
)
    ),
    );
  }
}
