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
      builder: (coonntext, state) {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final subject = state.subjectState.data![index];
              return SubjectItem(image: subject.icon, title: subject.name);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16.0);
            },
            itemCount: state.subjectState.data!.length,
          ),
        );
      },
    );
  }
}
