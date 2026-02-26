import 'package:elearning/feature/explore/presentation/view/widgets/explore/subject_item.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_cubit.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        // if (state.subjectState.isLoading) {
        //   return
        //    Center(child:  Column(
        //      mainAxisAlignment: MainAxisAlignment.center,
        //      crossAxisAlignment: CrossAxisAlignment.center,
        //      children: [
        //        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
        //        LoadingAnimationWidget.inkDrop(color: AppColors.blue, size: 50.0),
        //      ],
        //    ),);
        // }
        // if (state.subjectState.isSuccess) {
          return  ListView.separated(
              shrinkWrap: true,
            padding: EdgeInsets.zero,
physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
                final subject = state.subjectState.data![index];
                return SubjectItem(image: subject.icon,
                    title: subject.name);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16.0);
              },
              itemCount: state.subjectState.data!.length,
            );
        // }
        // return const Center();
      },
    );
  }
}
