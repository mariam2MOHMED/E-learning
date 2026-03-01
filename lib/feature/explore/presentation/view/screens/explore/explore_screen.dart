import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elearning/core/di/di.dart';
import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/feature/explore/presentation/view/widgets/explore/exam_subject_list.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_cubit.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_event.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../widgets/explore/search_field.dart';
import '../../widgets/explore/subject_list.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ExploreCubit>()..doIntent(intent: const GetAllSubjectEvent())
            ..doIntent(intent: const GetAllExamsEvent()),
      child:
    SingleChildScrollView(
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56.0),
          Text(
            AppLocalizations.of(context)!.survey,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.blue),
          ),
          const SizedBox(height: 16.0),
          const SearchField(),
          const SizedBox(height: 40.0),
          Text(
            AppLocalizations.of(context)!.browse_by_subject,
            style: Theme.of(context).textTheme.titleMedium,
          ),
         BlocBuilder<ExploreCubit,ExploreState>(builder: (context,state){
         return  ConditionalBuilder(condition: state.examsListStatus.isLoading ||
             state.subjectState.isLoading ,
             // ||state.subjectState.data==null ||
             // state.examsListStatus.data==null,

             builder: (context){
           return
              Center(child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  LoadingAnimationWidget.inkDrop(color: AppColors.blue,
                      size: 50.0),
                ],
              ),);
         }, fallback: (context){
           return
      const  SingleChildScrollView(
         child:       Column(
           children: [
             ExamSubjectList(),
             SubjectList(),

           ],
         ),
       );
         });
         })
        ],
      ),
    ),
    );
  }
}
