import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/models/api_response_models/question_model.dart';
import 'package:topik_sir/screens/exam/single_question_view.dart';
import 'package:topik_sir/services/provider_services/exam_service.dart';
import 'package:topik_sir/widgets/main_app_bar/main_app_bar.dart';

import '../../config/theme_data/theme_data.dart';
import '../../models/api_response_models/exam_model.dart';
import '../../widgets/shimmer_loading/shimmer_exam_loader.dart';

class SingleExamView extends StatefulWidget {
  final String examId;
  final String examTitle;
  const SingleExamView(
      {super.key, required this.examId, required this.examTitle});

  @override
  State<SingleExamView> createState() => _SingleExamViewState();
}

class _SingleExamViewState extends State<SingleExamView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ExamService value, Widget? child) {
        return Scaffold(
          appBar:
              MainAppBar(title: widget.examTitle.toString(), enableBack: true),
          body: SizedBox(
            height: UI().screenHeight() * 0.6,
            width: UI().screenWidth() * 0.6,
            child: Consumer(
              builder:
                  (BuildContext context, ExamService value, Widget? child) {
                return FutureBuilder(
                    future: value.getQuestions(widget.examId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none) {
                        return const ExamListLoading();
                      } else if (snapshot.hasData || snapshot.data != null) {
                        return ListView.builder(
                            itemCount: snapshot.data!.groups.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                           SingleQuestionView(question: snapshot.data!.groups[index].questions)),
                                  );
                                },
                                child: Card(
                                  margin: const EdgeInsets.all(10),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 20, 5, 20),
                                        child: Text(
                                          snapshot.data!.groups[index].title
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: UI().screenHeight()*0.1,
                                      //   child: ListView.builder(
                                      //     itemCount: snapshot.data!.groups[index].questions.length,
                                      //       itemBuilder: (BuildContext context,int element){
                                      //         return Text(snapshot.data!.groups[index].questions[element].title.toString());
                                      //       }
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              );
                              return Text(
                                  snapshot.data!.groups[index].toString());
                            });
                      } else {
                        return const ExamListLoading();
                      }
                    });
              },
            ),
          ),
        );
      },
    );
  }
}
