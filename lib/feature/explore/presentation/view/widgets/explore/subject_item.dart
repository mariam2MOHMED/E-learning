import 'package:elearning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.darkWhite, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,

      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            Image.network(image, width: 48.0, height: 48.0, fit: BoxFit.cover),
            const SizedBox(width: 14.5),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
class ExamSubjectItem extends StatelessWidget {
  const ExamSubjectItem({super.key,
    required this.image,
    required this.title});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.darkWhite, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,

      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            Image.network(image, width: 48.0, height: 48.0, fit: BoxFit.cover),
            const SizedBox(width: 14.5),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
List<String>images=[
  "https://static.vecteezy.com/system/resources/previews/027/127/463/original/javascript-logo-javascript-icon-transparent-free-png.png",
  "https://cdn.freebiesupply.com/logos/large/2x/css-3-logo-png-transparent.png",
  "https://w7.pngwing.com/pngs/390/229/png-transparent-logo-html5-brand-design-text-logo-number.png",
  "https://cdn.freebiesupply.com/logos/large/2x/react-1-logo-png-transparent.png"
];
