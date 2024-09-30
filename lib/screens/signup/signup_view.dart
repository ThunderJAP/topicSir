import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topik_sir/services/provider_services/signup_service.dart';
import 'package:topik_sir/widgets/background_image/background_image.dart';
import '../../methods/response_message_methods/response_methods.dart';


class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController rePasswordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(imageName: '7.png'),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Image.asset('assets/logo.png')),
                      )),
                  const Text(
                    "Create an Account",
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
                          return 'Please password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: rePasswordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.password),
                          prefixIconColor: Theme.of(context).primaryColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          labelText: 'Re-type Password',
                          hintText: 'Enter secure password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please re-type password';
                        } else if (passwordCtrl.text != value) {
                          return 'Password not matching';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer(
                    builder: (BuildContext context, SignUpService value,
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
                                  await value
                                      .signUp(emailCtrl.text, passwordCtrl.text)
                                      .then((value) => ResponseMessage.success(context,
                                          'Your account successfully created','/login'));
                                } catch (e) {
                                  if (context.mounted) {
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
                                  'Signup',
                                  style: TextStyle(color: Colors.white),
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
                        child: Text('or Signup With'),
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
                              padding: const EdgeInsets.all(8.0),
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
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/login'),
                            child: const Text(
                              'Login',
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
          )
        ],
      ),
    );
  }


}
