import 'package:flutter/cupertino.dart';

import '../../methods/shared_preference_methods/shared_preference_value.dart';
import '../../models/api_response_models/base_api_model.dart';
import '../../models/api_response_models/user_model.dart';
import '../api_services/api_provider.dart';

class SignUpService extends ChangeNotifier{
  final api = ApiProvider();
  Future<bool> signUp(String email, String password) async {
    try {
      var response = await api.userSignUp(email, password);
      UserModel userResponse=UserModel.fromJson(response);
      if (userResponse.success == true) {
        SharedPreferenceValue().setValue(1, 'token', userResponse.data!.accessToken);
      }
      return true;
    } catch (e) {
      rethrow;
      //return e.toString();
    }
  }
}