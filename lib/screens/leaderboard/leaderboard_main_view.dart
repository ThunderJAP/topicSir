import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/widgets/shimmer_loading/shimmer_exam_loader.dart';

import '../../config/theme_data/theme_data.dart';
import '../../services/provider_services/leaderboard_service.dart';
import '../../widgets/main_app_bar/main_app_bar.dart';
import '../../widgets/shimmer_loading/shimmer_leaderboard_loader.dart';

class LeaderBoardMainView extends StatefulWidget {
  const LeaderBoardMainView({super.key});

  @override
  State<LeaderBoardMainView> createState() => _LeaderBoardMainViewState();
}

class _LeaderBoardMainViewState extends State<LeaderBoardMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: "Leader Board",
        enableBack: false,
      ),
      body: SingleChildScrollView(child: Consumer(builder:
          (BuildContext context, LeaderBoardService value, Widget? child) {
        return Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: UI().screenWidth(),
                    height: 250,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(
                      'assets/leader_board.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const LeaderBoardLoader(),
              ],
            ),
            SizedBox(
              height: UI().screenHeight() / 2,
              child: FutureBuilder(
                  future: value.fetchLeaderBoard(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return const ExamListLoading();
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.account_circle_rounded,
                                        size:80 ,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                         Row(
                                           children: [
                                             Text("${snapshot.data![index].owner!.name!.first} ${snapshot.data![index].owner!.name!.last}"
                                                 .toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                                           ],
                                         ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${snapshot.data![index].score}            ${snapshot.data![index].attempts} tasks"
                                                  .toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),),

                                            ],
                                          )
                                        ],
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const ExamListLoading();
                    }
                  }),
            ),
          ],
        );
      })),
    );
  }
}
