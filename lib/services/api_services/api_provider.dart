import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:topik_sir/methods/shared_preference_methods/shared_preference_value.dart';
import 'package:topik_sir/services/api_services/api_controllers_name/api_controllers_name.dart';
import '../exception_service/exception_handler.dart';

class ApiProvider {
  String baseUrl = "topik-api.xtream360.com";
  static const int timeOutDuration = 35;



  //GET
  Future<dynamic> get(String controller,Map<String,dynamic> queryParams) async {
  String token=await SharedPreferenceValue().getValue(1, 'token');
    //var uri = Uri.parse("$baseUrl$controller$queryParams");
  try {
   var uri = Uri.https(baseUrl,controller,queryParams);
  print(uri);
    var response =
    await http.get(uri,
        headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'}).timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  //POST
  Future<dynamic> post(Map<String, dynamic> data, String controller) async {
    String token=await SharedPreferenceValue().getValue(1, 'token')??" ";
    var uri = Uri.https(baseUrl,controller);

    try {
      var response = await http
          .post(uri, body: data,
      headers: {
        'Authorization': 'Bearer $token'}).timeout(const Duration(seconds: timeOutDuration))
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);

    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<dynamic> userLogin(String email, String password) async {
    Map<String, dynamic> bodyData = {
      "email": email.trim(),
      "password": password
    };
    try {
      return await post(bodyData, ApiController.loginController);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> userSignUp(String email, String password) async {

    Map<String, dynamic> bodyData = {
      "email": email.trim(),
      "password": password
    };
    try {
      return await post(bodyData, ApiController.signUpController);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAllExams(String id,int page,int limit,String cat) async {
    Map<String, dynamic> queryParams = {
      "id": id,
      "page": page.toString(),
      "limit":limit.toString(),
      "cat":cat
    };
    try {
      return await get(ApiController.allExamController,queryParams);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getDictionaryResult(String query,String lang,int page,int limit) async {
    Map<String, dynamic> queryParams = {
      "query": query,
      "lang": lang,
      "page":page.toString(),
      "limit":limit.toString()
    };
    try {
      return await get(ApiController.dictionaryController,queryParams);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getVideos() async {
    Map<String, dynamic> queryParams = {};
    try {
      return await get(ApiController.videoController,queryParams);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getLeaderBoard() async {
    Map<String, dynamic> queryParams = {};
    try {
      return await get(ApiController.leaderBoardController,queryParams);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getGrammar(int page,int limit) async {
    Map<String, dynamic> queryParams = {
      "page":page.toString(),
      "limit":limit.toString()
    };
    try {
      return await get(ApiController.grammarController,queryParams);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> newExamAttempt(String examID) async {
    Map<String, dynamic> bodyData = {
      "exam": examID.toString(),
    };
    try {
      return await post(bodyData, ApiController.newExamAttempt);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getQuestion(String attemptID) async {
    Map<String, dynamic> queryParams = {
      "attempt":attemptID,
    };
    try {
      return await get(ApiController.questionAttempt,queryParams);
    } catch (e) {
      rethrow;
    }
  }

  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
       return responseJson;
      case 400: //Bad request
        throw BadRequestException(response.body.toString());
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }
}
