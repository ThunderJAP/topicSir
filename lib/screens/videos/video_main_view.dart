import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/models/api_response_models/video_model.dart';
import 'package:topik_sir/screens/videos/single_video_view.dart';
import 'package:topik_sir/widgets/main_app_bar/main_app_bar.dart';
import 'package:topik_sir/widgets/shimmer_loading/shimmer_video_loader.dart';

import '../../config/theme_data/theme_data.dart';
import '../../services/provider_services/video_service.dart';

class VideoMainView extends StatefulWidget {
  const VideoMainView({super.key});

  @override
  State<VideoMainView> createState() => _VideoMainViewState();
}

class _VideoMainViewState extends State<VideoMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: "Videos", enableBack: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Container(
            //     height: 50,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50),
            //         color: Colors.white),
            //     child: TextField(
            //       decoration: InputDecoration(
            //           isDense: true,
            //           prefixIcon: const Icon(
            //             Icons.search,
            //             size: 32,
            //           ),
            //           prefixIconColor: Theme.of(context).primaryColor,
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(50)),
            //           //labelText: 'Email or username',
            //           hintText: 'Search Your Topic'),
            //     ),
            //   ),
            // ),
            Consumer(builder:
                (BuildContext context, VideoService value, Widget? child) {
              return SizedBox(
                height: UI().screenHeight()/2.2,
                child: FutureBuilder<List<VideoData>>(
                    future: value.fetchVideos(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none) {
                        return const VideoLoader();
                      } else if (snapshot.hasData || snapshot.data != null) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: videoItem(snapshot.data![index])
                              );
                            });
                      } else {
                        return const VideoLoader();
                      }
                    }),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget videoItem(VideoData videoData) {
    return Container(
      width: UI().screenWidth(),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Center(
            child: IconButton(
              onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return SingleVideoView(url: videoData.url.toString(), title: videoData.title.toString());
                });
              },
              icon:  Icon(Icons.play_arrow_rounded,size: 80,color: Theme.of(context).primaryColor,),
            ),
          ),

    //   FadeInImage(
    //   image: NetworkImage(
    //       videoData.url.toString()),
    //   placeholder: const AssetImage('assets/poster.png'),
    // ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(videoData.title.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
          ),
           //Image.network(videoData.url.toString()),

        ],
      ),
    );
  }
}
