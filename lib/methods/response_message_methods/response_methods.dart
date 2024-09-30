
import 'package:flutter/material.dart';

import '../../widgets/custom_snackbar/custom_snackbar.dart';

class ResponseMessage{

  static void success(BuildContext context, String message,String routeName) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(CustomSnackBar().showSnack(message, 1));
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  static void failed(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(CustomSnackBar().showSnack(message, 3));
  }
}