import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/models/api_response_models/exam_model.dart';
import 'package:topik_sir/screens/exam/single_exam_view.dart';
import 'package:topik_sir/services/provider_services/exam_service.dart';

import '../../config/theme_data/theme_data.dart';
import '../../methods/response_message_methods/response_methods.dart';
import '../../utills/dialog_utill/dialog_util.dart';

final ValueNotifier<bool> _loading = ValueNotifier<bool>(false);

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    String examId = result.id.toString();
    return Consumer(
      builder: (BuildContext context, ExamService value, Widget? child) {
        return GestureDetector(
          onTap: () async {
            bool userResponse = await DialogUtils.conformationDialogs(
                context,
                "Attempting New Exam",
                "Are you sure, You want to attempt this examination?");
            try{
              if (userResponse) {
                _loading.value = true;
                if (context.mounted) {
                  DialogUtils.loadingDialog(context, _loading);

                    value.getNewExamAttemptID(examId).then((value) => {
                      _loading.value = false,
                      if(value.length>26){
                        ResponseMessage.failed(context, value.toString().substring(value.indexOf("message"),value.length))
                      }
                      else{
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleExamView(examId: value,examTitle: result.title.toString(),)),
                        )
                      }

                    });


                } else {
                  _loading.value = false;
                  return;
                }
              }
            }catch (e){
              _loading.value = false;
              if (context.mounted) {
                _loading.value=false;
                ResponseMessage.failed(context, e.toString());
              }
            }

          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 70,
              width: UI().screenWidth(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      'assets/exam_list_icon.png',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    result.title.toString(),
                    style: UI().titleTheme(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
