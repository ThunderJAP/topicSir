import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/theme_data/theme_data.dart';

class ExamListLoading extends StatelessWidget {
  const ExamListLoading({super.key});

  Widget loadingItem() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade300,
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(100)),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: UI().screenWidth() * 0.24,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Container(
                    width: UI().screenWidth() * 0.19,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Container(
                    width: UI().screenWidth() * 0.12,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ],
              ),
            ),
            // const Icon(
            //   Icons.play_arrow_rounded,
            //   size: 50,
            // ),
            const SizedBox(width: 10,)
          ],
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
