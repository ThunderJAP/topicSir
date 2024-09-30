import 'package:flutter/material.dart';

import '../../widgets/loading_window/loading_window.dart';

class LoadingMethod{

  static loading(BuildContext context,ValueNotifier<bool> loading) {
    return ValueListenableBuilder<bool>(
        valueListenable: loading,
        builder: (context, value, _) {
          return Visibility(visible: value, child: const LoadingWindow());
        });
    //   showDialog(context: context, builder: (BuildContext context,){
    //     return const LoadingWindow();
    //   },barrierDismissible: false);
    // }
  }

  static loadingDialog(BuildContext context,ValueNotifier<bool> loading) {
    return ValueListenableBuilder<bool>(
        valueListenable: loading,
        builder: (context, value, _) {
          return Visibility(visible: value, child: const LoadingWindow());
        });
    //   showDialog(context: context, builder: (BuildContext context,){
    //     return const LoadingWindow();
    //   },barrierDismissible: false);
    // }
  }

}