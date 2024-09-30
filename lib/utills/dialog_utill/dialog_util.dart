import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topik_sir/methods/loading_methods/loading_method.dart';

import '../../widgets/custom_dialog_boxes/conformation_dialog/conformation_dialog.dart';

class DialogUtils{

  static Future<bool>conformationDialogs(BuildContext context,String title,String content){
    return   showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConformationDialog(
              title: title,
              content: content,
              continueCallBack: (){});
        }).then(( value) => value);
  }

  static Future<void>loadingDialog(BuildContext context,ValueNotifier<bool> loading){
    return   showDialog(
        context: context,
        builder: (BuildContext context)
    {
      return LoadingMethod.loadingDialog(context, loading);
    });
  }
}