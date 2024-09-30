import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/theme_data/theme_data.dart';

class LoadingWindow extends StatelessWidget {
  const LoadingWindow({super.key});

  @override
  Widget build(BuildContext context) {
return Container(
  color: Colors.black45,
  width: UI().screenWidth(),
  height: UI().screenHeight(),
  child:    const Center(
    child: SpinKitSpinningLines(
      color: Colors.white,
    )
  ),
);
  }
}
