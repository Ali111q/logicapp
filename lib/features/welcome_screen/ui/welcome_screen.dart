import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logic_study_app/controller/user_controller.dart';
import 'package:provider/provider.dart';

import '../../../Constants/blue_button.dart';
import '../../../Constants/text_fields.dart';
import '../../../regestration/ui/regestration_screen.dart';
import '../../university/ui/pick_university.dart';

class WelcomeScreenStateNotifier extends ChangeNotifier {
  final WelcomeScreenState _state = WelcomeScreenState();

  WelcomeScreenState get state => _state;

  void onCheckChanged(bool value) {
    _state.isChecked = value;
    notifyListeners();
  }

  void setLoggedIn(bool value) {
    _state.loggedIn = value;
    notifyListeners();
  }
}

class WelcomeScreenState {
  bool isChecked = false;
  bool loggedIn = false;
}

class WelcomeScreenController extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeScreenStateNotifier(),
      builder: (context, _) {
        final stateNotifier = Provider.of<WelcomeScreenStateNotifier>(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffEFEFF4),
          ),
          backgroundColor: const Color(0xffEFEFF4),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 190.0, top: 200),
                      child: Text(
                        "تسجيل دخول",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFieldCustom(
                      labeltext:
                          "                                                                                      البريد الالكتروني",
                      textFieldController: _emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Password text field
                    TextFieldCustom(
                      textFieldController: _passwordController,
                      labeltext:
                          "                                                                                            كلمة المرور",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 290.0),
                      child: Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Consumer<WelcomeScreenStateNotifier>(
                            builder: (context, notifier, _) => Checkbox(
                              value: notifier.state.isChecked,
                              activeColor: const Color.fromARGB(255, 0, 0, 0),
                              checkColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              onChanged: (value) {
                                notifier.onCheckChanged(value ?? false);
                              },
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'بالتسجيل ، فإنك توافق على الشروط والأحكام وسياسة الخصوصية الخاصة',
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Consumer<WelcomeScreenStateNotifier>(
                      builder: (context, notifier, _) => InkWell(
                        onTap: notifier.state.isChecked
                            ? () async {
                                
                            await   Provider.of<UserController>(context, listen: false).login(_emailController.text, _passwordController.text, context).then((value) {
                            });
                              }
                            : null, // Disable the onTap function
                        child: Kbutton(
                          text: 'تسجيل الدخول',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "أو بأستخدام",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(child: Divider()),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/google.png",
                          height: 58,
                          width: 58,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/apple.png",
                          height: 58,
                          width: 58,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => RegestrationScreen(),));
                          },
                          child: Text(
                            "انشئ حساب ",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Text("ليس لديك حساب ؟"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<void> login(
  String email,
  String password,
  BuildContext context,
  WelcomeScreenStateNotifier stateNotifier,
) async {
  const url = 'https://dashboard.logic-study.com/api/login';
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Login successful, set loggedIn to true
    stateNotifier.setLoggedIn(true);
    // Navigate to PickUniversityScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PickUniversity(),
      ),
    );
  } else {
    // Login failed, show an error message
    // You can use a snackbar, dialog, or any other method to display the error.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
