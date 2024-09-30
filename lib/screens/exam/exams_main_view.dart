import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/services/provider_services/exam_service.dart';
import 'package:topik_sir/widgets/background_image/background_image.dart';
import 'package:topik_sir/widgets/main_app_bar/main_app_bar.dart';
import 'package:topik_sir/widgets/shimmer_loading/shimmer_exam_loader.dart';

import '../../config/theme_data/theme_data.dart';
import '../../models/api_response_models/exam_model.dart';
import '../../widgets/exam_list_card/exam_card.dart';

class ExamsMainView extends StatefulWidget {
  const ExamsMainView({super.key});

  @override
  State<ExamsMainView> createState() => _ExamsMainViewState();
}

class _ExamsMainViewState extends State<ExamsMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Exams', enableBack: true,
      ),
      body: Stack(
        children: [
          const BackgroundImage(imageName: '6.png'),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: UI().screenWidth(),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(
                      'assets/exam_top_poster.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 70,
                    width: UI().screenWidth(),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset:
                                const Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            'assets/exam_list_icon.png',
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Text('Exam Information',style: UI().titleTheme(),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 70,
                    width: UI().screenWidth(),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset:
                            const Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 20,),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            'assets/exam_result_list_icon.png',
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Text('Exam Results',style: UI().titleTheme(),),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: UI().screenHeight()*0.6,
                  width: UI().screenWidth()*0.6,
                  child: Consumer(
                    builder: (BuildContext context, ExamService value, Widget? child) {
                      return FutureBuilder(
                          future: value.getAllExams(), builder: (context,snapshot){
                        if (snapshot.connectionState ==
                            ConnectionState.none) {
                          return const ExamListLoading();
                        } else if (snapshot.hasData||snapshot.data!=null) {
                          return ListView.builder(
                              itemCount: snapshot.data!.count,
                              itemBuilder: (BuildContext context,int index){
                           return  ExamCard(result: snapshot.data!.result[index],);
                          });
                        } else {
                          return const ExamListLoading();
                        }
                      });
                    },),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
