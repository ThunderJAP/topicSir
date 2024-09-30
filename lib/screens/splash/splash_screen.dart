import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/theme_data/theme_data.dart';
import '../../methods/shared_preference_methods/shared_preference_value.dart';
import '../../widgets/background_image/background_image.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  void getUserDetails()async {
    String? token=await SharedPreferenceValue().getValue(1,"token");
    Future.delayed(const Duration(seconds: 4), () {
      if(token==null||token==''||token.isEmpty){
        if(context.mounted){
          Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);}
      }
      else{
        if(context.mounted){
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);}
      }
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(
            imageName: '4.png',
          ),
          SizedBox(
           width: UI().screenWidth(),
            height: UI().screenHeight(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Image.asset('assets/topicsir2.png')),
                    )),
                const SizedBox(height: 20,),
                SpinKitSpinningLines(
                  color: Theme.of(context).primaryColor,
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
