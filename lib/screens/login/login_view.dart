import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/methods/response_message_methods/response_methods.dart';
import 'package:topik_sir/services/provider_services/login_service.dart';
import '../../methods/loading_methods/loading_method.dart';
import '../../widgets/background_image/background_image.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _loading = ValueNotifier<bool>(false);
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(
            imageName: '6.png',
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset('assets/logo.png')),
                        )),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: emailCtrl,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.email_rounded),
                            prefixIconColor: Theme.of(context).primaryColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            labelText: 'Email or username',
                            hintText: 'Enter valid email id as abc@gmail.com'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email address';
                          } else if (EmailValidator.validate(value) == false) {
                            return 'Please enter valid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: passwordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.password),
                            prefixIconColor: Theme.of(context).primaryColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 30.0),
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text("Forget Password?")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer(
                      builder: (BuildContext context, LoginService value,
                          Widget? child) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    _loading.value=true;
                                    await value
                                        .userLogin(
                                            emailCtrl.text, passwordCtrl.text)
                                        .then((value) {
                                          _loading.value=false;
                                        ResponseMessage.success(
                                            context, 'Login Success','/home');});
                                  } catch (e) {
                                    if (context.mounted) {
                                      _loading.value=false;
                                      ResponseMessage.failed(context, e.toString());
                                    }
                                  }
                                }
                              },
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: const Center(
                                      child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )))),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Divider(color: Colors.black)),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('or Login With'),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Divider(color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () {},
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                    child: Image.asset(
                                        'assets/logos_google-icon.png')),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/signUp'),
                              child: const Text(
                                'Signup',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          LoadingMethod.loading(context, _loading)
        ],
      ),
    );
  }

}
