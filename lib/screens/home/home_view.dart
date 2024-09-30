import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/screens/exam/exams_main_view.dart';
import 'package:topik_sir/services/provider_services/home_service.dart';

import '../dashboard/dashboard_view.dart';
import '../leaderboard/leaderboard_main_view.dart';
import '../videos/video_main_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeService>(
        builder: (BuildContext context, HomeService value, Widget? child) {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          items: <Widget>[
            Icon(Icons.home_rounded,
                size: 30, color: Theme.of(context).primaryColor),
            Icon(Icons.access_time_filled_rounded,
                size: 30, color: Theme.of(context).primaryColor),
            Icon(Icons.diamond_rounded,
                size: 30, color: Theme.of(context).primaryColor),
            Icon(Icons.search_rounded,
                size: 30, color: Theme.of(context).primaryColor),
          ],
          onTap: (index) {
            value.setPageIndex(index);

            //Handle button tap
          },
        ),
        //All main Views calls here
        body: value.pageIndex == 0
            ? const DashBoardView()
            : value.pageIndex == 1
                ?const ExamsMainView()
                : value.pageIndex == 2
                    ? const LeaderBoardMainView()
                    : const VideoMainView(),
      );
    });
  }
}
