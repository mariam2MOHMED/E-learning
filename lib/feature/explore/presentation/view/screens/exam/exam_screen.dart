import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elearning/core/di/di.dart';
import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:elearning/feature/explore/presentation/view/widgets/exam/buttons_exam.dart';
import 'package:elearning/feature/explore/presentation/view/widgets/exam/question_item.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_cubit.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_event.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../core/l10n/app_localizations.dart';
import '../../../../../../core/theme/app_colors.dart';

// class ExamScreen extends StatefulWidget {
//   const ExamScreen({
//     super.key,
//     required this.examEntity,
//   });
//
//   final ExamEntity examEntity;
//
//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }
//
// class _ExamScreenState extends State<ExamScreen> {
//   late final PageController pageController;
//   double progress = 0;
//   late int endTime;
//
//   late  int totalQuestions = widget.examEntity.numberOfQuestions;
//   @override
//   void initState() {
//     super.initState();
//
//     pageController = PageController();
//
//     final now = DateTime.now().millisecondsSinceEpoch;
//     endTime = now + (widget.examEntity.duration * 60 * 1000);
//
//     pageController.addListener(() {
//       final value =
//           (pageController.page ?? 0) / (totalQuestions - 1);
//
//       setState(() {
//         progress = value.clamp(0.0, 1.0);
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return BlocProvider.value(
//       value: getIt<ExploreCubit>()..
//       doIntent(intent: GetAllQuestionsEvent(widget.examEntity.id)),
//       child: BlocBuilder<ExploreCubit, ExploreState>(
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back_ios_rounded,
//                   color: AppColors.gray,
//                   size: 20.0,
//                 ),
//               ),
//               title: Text(
//                 AppLocalizations.of(context)!.onlineExam,
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               actions: [
//                 Image.asset("assets/images/time.png"),
//                 const SizedBox(width: 5.0),
//                 CountdownTimer(
//                   endTime: endTime,
//                   widgetBuilder: (_, time) {
//
//                     if (time == null) {
//                       return Text(
//                         "00:00",
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium
//                             ?.copyWith(color: AppColors.green),
//                       );
//                     }
//
//                     final minutes = time.min ?? 0;
//                     final seconds = time.sec ?? 0;
//
//                     return Text(
//                       "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium
//                           ?.copyWith(
//                         color: (minutes == 0 && seconds < 60)
//                             ? AppColors.red
//                             : AppColors.green,
//                       ),
//                     );
//                   },
//                   onEnd: () {
//                     print("Exam Finished");
//                   },
//                 ),
//               ],
//             ),
//             body: ConditionalBuilder(
//               condition: state.questionsListStatus.isInitial ||
//                   state.questionsListStatus.isLoading,
//               builder: (_) => Center(
//                 child: LoadingAnimationWidget.inkDrop(
//                   color: AppColors.blue,
//                   size: 50.0,
//                 ),
//               ),
//               fallback: (_) => PageView.builder(
//                 controller: pageController,
//                 itemCount: state.questionsListStatus.data?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   final question =
//                   state.questionsListStatus.data![index];
//
//                   return Padding(
//                     padding: const EdgeInsetsDirectional.symmetric(
//                       horizontal: 16.0,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 10.0),
//                         Align(
//                           alignment: AlignmentDirectional.center,
//                           child: Text(
//                             "${AppLocalizations.of(context)!.questions} ${index + 1} of ${state.questionsListStatus.data!.length}",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium,
//                           ),
//                         ),
//                         const SizedBox(height: 20.0),
//                         Text(
//                           question.question,
//                           style: Theme.of(context)
//                               .textTheme
//                               .displayMedium,
//                         ),
//                         const SizedBox(height: 20.0),
//                         Expanded(
//                           child: ListView.separated(
//                             itemBuilder: (context, ind) {
//                               return QuestionItem(
//                                 index: ind,
//                                 questionEntity: question,
//                               );
//                             },
//                             separatorBuilder: (_, __) =>
//                             const SizedBox(height: 16.0),
//                             itemCount: question.answers.length,
//                           ),
//                         ),
//                         const Spacer(flex: 1),
//                         ButtonsExam(
//                           nextPress: () {
//                             pageController.nextPage(
//                               duration:
//                               const Duration(seconds: 1),
//                               curve: Curves.easeInOutBack,
//                             );
//                           },
//                           backPress: () {
//                             pageController.previousPage(
//                               duration:
//                               const Duration(seconds: 1),
//                               curve: Curves.easeInOutBack,
//                             );
//                           },
//                         ),
//                         const Spacer(flex: 3),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
class ExamScreen extends StatefulWidget {
  const ExamScreen({
    super.key,
    required this.examEntity,
  });

  final ExamEntity examEntity;

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late final PageController pageController;
  late final ExploreCubit cubit;

  late int endTime;
  double progress = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController();

    // 🟢 نحسب وقت نهاية الامتحان مرة واحدة بس
    final now = DateTime.now().millisecondsSinceEpoch;

    final durationMinutes =
    widget.examEntity.duration == 0 ? 1 : widget.examEntity.duration;

    endTime = now + (durationMinutes * 60 * 1000);

    // 🟢 إنشاء الكيوبت مرة واحدة فقط
    cubit = getIt<ExploreCubit>();
    cubit.doIntent(
      intent: GetAllQuestionsEvent(widget.examEntity.id),
    );

    // 🟢 Progress listener
    pageController.addListener(() {
      final total = cubit.state.questionsListStatus.data?.length ?? 1;

      if (total > 1) {
        final value = (pageController.page ?? 0) / (total - 1);
        setState(() {
          progress = value.clamp(0.0, 1.0);
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.gray,
                  size: 20,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.onlineExam,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              actions: [
                Image.asset("assets/images/time.png"),
                const SizedBox(width: 5),

                /// 🟢 Countdown ثابت ومش بيعمل glitch
                CountdownTimer(
                  endTime: endTime,
                  widgetBuilder: (_, time) {
                    if (time == null) {
                      return Text(
                        "00:00",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.red),
                      );
                    }

                    final minutes = time.min ?? 0;
                    final seconds = time.sec ?? 0;

                    return Text(
                      "${minutes.toString().padLeft(2, '0')} : "
                          "${seconds.toString().padLeft(2, '0')}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                        color: (minutes == 0 && seconds < 60)
                            ? AppColors.red
                            : AppColors.green,
                      ),
                    );
                  },
                  onEnd: () {
                    debugPrint("Exam Finished");

                    // هنا تقدري تعملي submit تلقائي
                    // cubit.submitExam();
                  },
                ),
              ],
            ),

            /// 🟢 Progress Bar فوق الأسئلة
            body: Column(
              children: [
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state.questionsListStatus.isLoading,
                    builder: (_) => Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: AppColors.blue,
                        size: 50,
                      ),
                    ),
                    fallback: (_) {
                      final questions =
                          state.questionsListStatus.data ?? [];

                      return PageView.builder(
                        controller: pageController,
                        itemCount: questions.length,
                        itemBuilder: (context, index) {
                          final question = questions[index];

                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),

                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${AppLocalizations.of(context)!.questions} "
                                        "${index + 1} of ${questions.length}",
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Text(
                                  question.question,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium,
                                ),

                                const SizedBox(height: 20),

                                Expanded(
                                  child: ListView.separated(
                                    itemBuilder: (context, ind) {
                                      return QuestionItem(
                                        index: ind,
                                        questionEntity: question,
                                      );
                                    },
                                    separatorBuilder: (_, __) =>
                                    const SizedBox(height: 16),
                                    itemCount:
                                    question.answers.length,
                                  ),
                                ),

                                ButtonsExam(
                                  nextPress: () {
                                    if (index < questions.length - 1) {
                                      pageController.nextPage(
                                        duration:
                                        const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  backPress: () {
                                    if (index > 0) {
                                      pageController.previousPage(
                                        duration:
                                        const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                ),

                                const SizedBox(height: 30),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}