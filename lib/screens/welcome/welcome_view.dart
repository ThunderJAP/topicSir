import 'package:flutter/material.dart';
import '../../methods/loading_methods/loading_method.dart';
import '../../widgets/background_image/background_image.dart';

class WelcomeView extends StatelessWidget {
   WelcomeView({super.key});

  final ValueNotifier<bool> _loading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(
            imageName: '1.png',
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(child: Image.asset('assets/logo.png')),
                const SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const SizedBox(
                        width: 250,
                        height: 50,
                        child: Center(
                            child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )))),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () => {
                      _loading.value=true,
                      Future.delayed(const Duration(seconds: 2),(){  Navigator.pushNamed(context, '/signUp');}),

                      _loading.value=false,
                    },
                    child: const SizedBox(
                        width: 250,
                        height: 50,
                        child: Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))))
              ],
            ),
          ),
          LoadingMethod.loading(context, _loading)
        ],
      ),
    );
  }
}
