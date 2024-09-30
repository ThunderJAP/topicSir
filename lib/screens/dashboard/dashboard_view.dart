import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topik_sir/config/theme_data/theme_data.dart';
import 'package:topik_sir/services/provider_services/dashboard_service.dart';
import 'package:topik_sir/widgets/background_image/background_image.dart';
import 'package:topik_sir/widgets/tools_item_button/tool_item_button.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardService>(
        builder: (BuildContext context, DashBoardService value, Widget? child) {
      return Stack(
        children: [
          const BackgroundImage(imageName: '3.png'),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: UI().screenWidth(),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Hello,",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    FutureBuilder<String>(
                                        future:
                                            DashBoardService().getUserName(),
                                        builder:
                                            (BuildContext context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.none) {
                                            return const Text("loading");
                                          } else if (snapshot.hasData) {
                                            return Text(
                                                snapshot.data!.substring(0, 5),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16));
                                          } else {
                                            return const Text("loading");
                                          }
                                        })
                                  ],
                                ),
                                PopupMenuButton(
                                  icon:  const Icon(
                                          Icons.person_2_rounded,
                                          color: Colors.white,
                                        ),
                                    onSelected: (value) async {
                                  // your logic
                                 if(value==1){
                                   final preferences = await SharedPreferences.getInstance();
                                         await preferences.clear();
                                   if(context.mounted){
                                     Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);}
                                 }
                                }, itemBuilder: (BuildContext bc) {
                                  return const [
                                    PopupMenuItem(
                                      value: 1,
                                      child: Text("Logout"),
                                    ),
                                    // PopupMenuItem(
                                    //   child: Text("About"),
                                    //   value: '/about',
                                    // ),
                                    // PopupMenuItem(
                                    //   child: Text("Contact"),
                                    //   value: '/contact',
                                    // )
                                  ];
                                })
                                // IconButton(
                                //     onPressed: () async {
                                //       final preferences = await SharedPreferences.getInstance();
                                //       await preferences.clear();
                                //     },
                                //     icon: const Icon(
                                //       Icons.person_2_rounded,
                                //       color: Colors.white,
                                //     ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: TextField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 32,
                                    ),
                                    prefixIconColor:
                                        Theme.of(context).primaryColor,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    //labelText: 'Email or username',
                                    hintText: 'Search Your Topic'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Text("Practice", style: UI().titleTheme()),
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       PracticeCard(
                  //         title: "Listening",
                  //         primaryIconName: "listening.png",
                  //         secondaryIconName: "b",
                  //         onTap: () {},
                  //       ),
                  //       PracticeCard(
                  //         title: "Writing",
                  //         primaryIconName: "writing.png",
                  //         secondaryIconName: "b",
                  //         onTap: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Tools", style: UI().titleTheme()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ToolItemButton(
                          title: "Exams",
                          primaryIconName: "Topik1.png",
                          onTap: () {
                            Navigator.pushNamed(context, '/exam');
                          },
                        ),
                        ToolItemButton(
                          title: "Dictionary",
                          primaryIconName: "dictionary.png",
                          onTap: () {
                            Navigator.pushNamed(context, '/dictionary');
                          },
                        ),
                        ToolItemButton(
                          title: "Korean",
                          primaryIconName: "Grammar.png",
                          onTap: () {
                            Navigator.pushNamed(context, '/grammar');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 300,
                        width: UI().screenWidth(),
                        child: Image.asset('assets/poster.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 50),
                      child: Container(
                        height: 260,
                        width: 200,
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {},
                          child: const Text(
                            "UPGRADE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
