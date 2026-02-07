import 'package:elearning/core/di/di.dart';
import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:elearning/feature/auth/presentation/view_model/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/register/register_intent.dart';
import '../widget/user_info_wid.dart';
import '../widget/user_personal_info_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.signUp,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: 
      Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: 
       BlocProvider(create:
           (context)=>getIt<RegisterCubit>()..doIntent(intent: const RegisterInitializationIntent()),
       child:  BlocConsumer<RegisterCubit, RegisterState>(
         listener: (context,state){
           if (state.registerStatus.isSuccess){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
             const Scaffold()));
           }
           if (state.registerStatus.isFailure){
             ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(state.registerStatus.error!.message)));
           }
         },
         builder: (context, state) {
           final registerCubit = BlocProvider.of<RegisterCubit>(context);
           return Form(
             autovalidateMode: state.autovalidateMode,
             key: registerCubit.formKey,
             child: Column(
               children: [
                 const SizedBox(height: 16.0),
                 UserInfoWidget(
                   firstName: registerCubit.firstName,
                   userName: registerCubit.userName,
                   lastName: registerCubit.lastName,
                 ),
                 const SizedBox(height: 16.0),

                 UserPersonalInfoWidget(
                   phone: registerCubit.phone,
                   password: registerCubit.password,
                   rePassword: registerCubit.repassword,
                   email: registerCubit.email,
                 ),
                 const SizedBox(height: 32.0),
                 ElevatedButton(
                   onPressed: () {
                     registerCubit.doIntent(
                       intent: const RegisterFormIntent(),
                     );
                   },
                   child: Text(AppLocalizations.of(context)!.signUp),
                 ),
               ],
             ),
           );
         },
       ),
       )
      ),
    );
  }
}
