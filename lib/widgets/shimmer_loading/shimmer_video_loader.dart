import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:topik_sir/config/theme_data/theme_data.dart';

class VideoLoader extends StatelessWidget {
  const VideoLoader({super.key});

  Widget loadingItem(){
    return  Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: UI().screenWidth(),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: UI().screenHeight()*0.6,
        width: UI().screenWidth()*0.6,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return loadingItem();
          },
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );

  }
}
