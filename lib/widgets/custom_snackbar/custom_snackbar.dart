import 'package:flutter/material.dart';

class CustomSnackBar{SnackBar showSnack(String message,int type){
  return    SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: type == 1
        ? Colors.green
        : type == 2
        ? Colors.blue
        : type == 3
        ? Colors.red
        : const Color(0xFF283C42),
  );
}


}
