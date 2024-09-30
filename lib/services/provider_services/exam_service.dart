import 'package:flutter/cupertino.dart';
import 'package:topik_sir/methods/response_message_methods/response_methods.dart';
import 'package:topik_sir/models/api_response_models/exam_model.dart';
import 'package:topik_sir/models/api_response_models/new_exam_model.dart';
import 'package:topik_sir/models/api_response_models/question_model.dart';

import '../../models/api_response_models/base_api_model.dart';
import '../api_services/api_provider.dart';

class ExamService extends ChangeNotifier {
  final api = ApiProvider();
  String examId = "";
  int page = 0;
  int limit = 20;
  String category = "";

  Future<ExamData?> getAllExams() async {
    try {
      ExamData exam;
      var response = await api.getAllExams(examId, page, limit, category);
      ExamModel examResponse = ExamModel.fromJson(response);
      if (examResponse.success == true) {
        exam = examResponse.data!;
        return exam;
      } else {
        return ExamData(count: 0, next: false, result: []);
      }
      //SharedPreferenceValue().setValue(5, 'name', userModel.name);
    } catch (e) {
      rethrow;
      //return e.toString();
    }
  }

  Future<String> getNewExamAttemptID(String examID) async {
    try {
      String attemptID = "";
      var response = await api.newExamAttempt(examID);
      NewExamModel examResponse = NewExamModel.fromJson(response);
      if (examResponse.success == true) {
        attemptID = examResponse.data!.attemptId!;
        return attemptID;
      }
      else if(examResponse.success == false){
        return examResponse.data.toString();
      }
      else {
        return attemptID;
      }
    } catch (e) {
      //rethrow;
      return e.toString();
    }
  }

  Future<QuestionData> getQuestions(String attemptID) async {
    try {
      QuestionData questionModel;
      var response = await api.getQuestion(attemptID);
      QuestionExamModel questionResponse = QuestionExamModel.fromJson(response);
      if (questionResponse.success == true) {
        questionModel = questionResponse.data!;
        return questionModel;
      } else {
        return QuestionData(
            attempt: "",
            exam: "",
            status: "",
            answeredCount: 0,
            createdAt: DateTime.now(),
            groups: []);
      }
    } catch (e) {
      rethrow;
      //return e.toString();
    }
  }
}
