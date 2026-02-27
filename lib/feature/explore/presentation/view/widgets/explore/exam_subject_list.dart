import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/feature/explore/presentation/view/widgets/explore/subject_item.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_cubit.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamSubjectList extends StatelessWidget {
  const ExamSubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit,ExploreState>(builder: (context,state){
      // final exams = state.examsListStatus.data;
      //
      // if (exams == null || exams.isEmpty) {
      //   return const SizedBox();
      // }
      return ListView.separated(
        padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
        return
         GestureDetector(
           onTap: (){
             Navigator.of(context).pushNamed(AppRoutes.subjectDetails,
             arguments:  state.examsListStatus.data![index]
             );
           },
       child:  ExamSubjectItem(image: images[index],
           title: state.examsListStatus.data![index].title),
         );
      },

          separatorBuilder:  (context,index){
            return const SizedBox(height: 12.0,);
          },
          itemCount: state.examsListStatus.data!.length);
    });
  }
}
