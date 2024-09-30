import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LeaderBoardLoader extends StatelessWidget {
  const LeaderBoardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade300,
    child: SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipOval(
            child: Container(
              width: 70,
              height: 70,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20,),
          ClipOval(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20,),
          ClipOval(
            child: Container(
              width: 70,
              height: 70,
              color: Colors.white,
            ),
          )
        ],
      ),
    ),);
  }
}
