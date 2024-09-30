import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/config/theme_data/theme_data.dart';
import 'package:topik_sir/models/api_response_models/dictionary_api_model.dart';
import 'package:topik_sir/services/provider_services/dictionary_service.dart';
import 'package:topik_sir/widgets/main_app_bar/main_app_bar.dart';

import '../../widgets/shimmer_loading/shimmer_exam_loader.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({super.key});

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  TextEditingController searchCtrl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryService>(builder:
        (BuildContext context, DictionaryService value, Widget? child) {
      //value.isSearch=false;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MainAppBar(title: "Dictionary", enableBack: true,),
        body: SizedBox(
          width: UI().screenWidth(),
          height: UI().screenHeight(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: UI().screenWidth(),
                      height: 80,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: UI().screenWidth() * 0.33,
                              child: TextField(
                                controller: searchCtrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.white,
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
                                    hintText: 'Search Your Word'),
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  value.setQuery(searchCtrl.text);
                                  value.setSearch(true);
                                },
                                child: const SizedBox(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                      "Search",
                                      style: TextStyle(color: Colors.white),
                                    ))))
                          ],
                        ),
                      ),
                    )),
                SingleChildScrollView(
                  child: value.isSearch == false
                      ? Center(
                        child: SizedBox(
                            width: UI().screenWidth(),
                            child: Image.asset(
                              'assets/search_default.jpg',
                              opacity: const AlwaysStoppedAnimation(.7),
                            ),
                          ),
                      )
                      : SizedBox(
                          height: UI().screenHeight(),
                          child: FutureBuilder<List<DictionaryData>>(
                              future: value.searchDictionaryWord(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.none) {
                                  return const ExamListLoading();
                                } else if (snapshot.hasData ||
                                    snapshot.data != null) {
                                  return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Icon(Icons.info_rounded,size: 26,color: Colors.green,),
                                                  const SizedBox(width: 15,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(snapshot.data![index].en
                                                          .toString()),
                                                   Text(snapshot.data![index].kr
                                                      .toString()),
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
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
