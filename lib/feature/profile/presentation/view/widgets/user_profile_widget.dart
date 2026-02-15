import 'package:elearning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
      const  CircleAvatar(
          radius: 50.0,
        backgroundImage: AssetImage("assets/images/Photo.png"),

          ),

        Container(
          width: 24.0,
          height: 24.0,
decoration: BoxDecoration(
  color:AppColors.purple,
  borderRadius: BorderRadiusDirectional.circular(6)
),
child: const Icon(Icons.camera_alt_outlined,color: AppColors.white,
size: 16.0,
),
        )

      ],
    );
  }
}
