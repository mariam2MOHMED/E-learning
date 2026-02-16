import 'package:elearning/core/di/di.dart';
import 'package:elearning/feature/auth/presentation/view/widget/user_info_wid.dart';
import 'package:elearning/feature/profile/presentation/view/widgets/user_profile_info.dart';
import 'package:elearning/feature/profile/presentation/view/widgets/user_profile_widget.dart';
import 'package:elearning/feature/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:elearning/feature/profile/presentation/view_model/profile/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../view_model/profile/profile_events.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          AppLocalizations.of(context)!.editProfile,
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
      getIt<ProfileCubit>()
        ..
        doIntent(intent: const GetLoggedUserInfoEvent()),
          child:
          BlocConsumer<ProfileCubit, ProfileStates>(builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            if (state.profileStatus.isLoading) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (state.profileStatus.isSuccess) {
              return
             Form(
               key: cubit.editFormKey,
                 autovalidateMode: state.editAutouvalidateMode,
                 child:    Column(
               children: [
                 const UserProfileWidget(),
                 const SizedBox(height: 16.0,),
                 UserInfoWidget(

                     userName:  cubit.userNameController,

                     firstName:cubit.firstNameController,


                     lastName:  cubit.lastNameController

                 ),
                 UserProfileInfo(

                   emailController:  cubit.emailController,

                   phoneController: cubit.phoneNumberController

                 ),
                 const SizedBox(height: 32.0,),
                 ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         backgroundColor: AppColors.primaryBlue,
                         fixedSize: Size(MediaQuery
                             .of(context)
                             .size
                             .width, 50)
                     ),
                     onPressed: () {
                       context.read<ProfileCubit>().doIntent(
                           intent: const EditProfileFormEvent());
                     },
                     child: Text(AppLocalizations.of(context)!.update))

               ],
             ));
            }
            return const Center();
          }, listener: (context, state) {
            if (state.editProfileStatus.isFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.editProfileStatus.error!.message)));            }
            if (state.editProfileStatus.isSuccess) {
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(AppLocalizations.of(context)!.updateProfile)));
            }
          })
      )
      ),
    );
  }
}


