import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/feature/profile/presentation/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../screens/explore/explore_screen.dart';
import 'bottom_nav_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
List<Widget>screens=[
 const ExploreScreen(),
  Column(),
 const ProfileScreen(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16.0,
      ),child: screens[currentIndex],),

      bottomNavigationBar:
  Container(
    padding: const EdgeInsetsDirectional.symmetric(
      vertical: 10
    ),
    decoration: const BoxDecoration(
      color: AppColors.lightBlue
    ),
    child:     Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BottomNavItem(
          iconData: Icons.home_outlined,
          title: AppLocalizations.of(context)!.explore,
          index: 0,
          isSelected: currentIndex == 0,
          onTap: (i) {
            setState(() => currentIndex = i);
          },
        ),
        BottomNavItem(
          iconData: Icons.assignment_outlined,
          title:AppLocalizations.of(context)!.result,
          index: 1,
          isSelected: currentIndex == 1,
          onTap: (i) {
            setState(() => currentIndex = i);
          },
        ),
        BottomNavItem(
          iconData: Icons.person_outline,
          title: AppLocalizations.of(context)!.profile,
          index: 2,
          isSelected: currentIndex == 2,
          onTap: (i) {
            setState(() => currentIndex = i);
          },
        ),
      ],
    ),
  )
    );
  }
}

