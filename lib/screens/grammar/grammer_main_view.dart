import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/models/api_response_models/grammar_model.dart';
import 'package:topik_sir/services/provider_services/grammer_service.dart';
import 'package:topik_sir/widgets/main_app_bar/main_app_bar.dart';
import 'package:topik_sir/widgets/shimmer_loading/shimmer_video_loader.dart';

import '../../config/theme_data/theme_data.dart';
import '../../widgets/shimmer_loading/shimmer_exam_loader.dart';

class GrammarMainView extends StatefulWidget {
  const GrammarMainView({super.key});

  @override
  State<GrammarMainView> createState() => _GrammarMainViewState();
}

class _GrammarMainViewState extends State<GrammarMainView> {
  @override
  Widget build(BuildContext context) {
     return Consumer<GrammarService>(builder:
        (BuildContext context, GrammarService value, Widget? child) {
       return Scaffold(
         appBar: const MainAppBar(title: 'Grammar',enableBack: true,),
         body: SizedBox(
           height: UI().screenHeight(),
           child: FutureBuilder<List<GrammarData>>(
               future: value.fetchGrammarData(),
               builder: (context, snapshot) {
                 if (snapshot.connectionState ==
                     ConnectionState.none) {
                   return const VideoLoader();
                 } else if (snapshot.hasData ||
                     snapshot.data != null) {
                   return ListView.builder(
                       itemCount: snapshot.data!.length,
                       itemBuilder:
                           (BuildContext context, int index) {
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                             child: ExpansionTile(
                               collapsedShape: const ContinuousRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20))
                               ),
                               shape: const ContinuousRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20))
                               ),
                               backgroundColor: Colors.green.shade50,
                                 collapsedBackgroundColor:Colors.grey.shade100,
                               title:  Text(snapshot.data![index].topic
                                   .toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                             subtitle: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(snapshot.data![index].content
                                     .toString(),style: const TextStyle(fontSize: 14),),
                                 const SizedBox(height: 10,),
                             
                               ],
                             ),
                             expandedAlignment: Alignment.topLeft,
                             expandedCrossAxisAlignment: CrossAxisAlignment.start,
                             children:  [
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 15.0),
                                       child: Text("Description:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor)),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Text(snapshot.data![index].desc
                                           .toString(),style: const TextStyle(fontSize: 14),),
                                     ),
                                     const SizedBox(height: 10,),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 15.0),
                                       child: Text("Examples:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor)),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Text(snapshot.data![index].example[index].a
                                           .toString()),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Text(snapshot.data![index].example[index].b
                                           .toString()),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Text(snapshot.data![index].example[index+1].a
                                           .toString()),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0),
                                       child: Text(snapshot.data![index].example[index+1].b
                                           .toString()),
                                     ),
                                   ],
                                 ),
                               )

                             ],),
                           ),
                         );
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Icon(Icons.graphic_eq_rounded,size: 26,color: Colors.green,),
                                   const SizedBox(width: 15,),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(snapshot.data![index].topic
                                           .toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                        Text("Content:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor)),
                                       Text(snapshot.data![index].content
                                           .toString(),style: const TextStyle(fontSize: 14),),
                                       const SizedBox(height: 10,),
                                       Text("Description:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor)),
                                       Text(snapshot.data![index].desc
                                           .toString(),style: const TextStyle(fontSize: 14),),
                                       const SizedBox(height: 10,),
                                       Text("Examples:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor)),
                                       Text(snapshot.data![index].example[index].a
                                           .toString()),
                                       Text(snapshot.data![index].example[index].b
                                           .toString()),
                                       Text(snapshot.data![index].example[index+1].a
                                           .toString()),
                                       Text(snapshot.data![index].example[index+1].b
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
                   return const VideoLoader();
                 }
               }),
         ),
       );
        });
  }
}
