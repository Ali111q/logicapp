import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logic_study_app/controller/user_controller.dart';
import 'package:logic_study_app/features/university/ui/pick_university.dart';
import 'package:provider/provider.dart';
import '../../features/university/ui/university_screen.dart';

class RegestrationScreen extends StatefulWidget {
  @override
  _RegestrationScreenState createState() => _RegestrationScreenState();
}

class _RegestrationScreenState extends State<RegestrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreedToTerms = false;
  bool _isLoading = false;
  bool _passwordsMatchError = false;

  Future<bool> _checkExistingAccount(String email) async {
    final url = Uri.parse('https://dashboard.logic-study.com/api/signup');
    final response = await http.post(url, body: {'email': email});

    if (response.statusCode == 200) {
      // Email already exists
      return true;
    } else {
      // Email doesn't exist
      return false;
    }
  }

  Future<void> _signUp() async {
    if (!_agreedToTerms) {
      // User didn't agree to terms, show an error message
      // You can use a snackbar, dialog, or any other method to display the error.
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _passwordsMatchError = true; // Show password match error
      });
      return;
    } else {
      setState(() {
        _passwordsMatchError = false; // Hide password match error
      });
    }

    setState(() {
      _isLoading = true; // Show loading animation
    });

    bool emailExists = await _checkExistingAccount(_emailController.text);

    if (emailExists) {
      // Email already exists, show a warning dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Email Already Exists'),
            content: const Text(
                'The provided email already has an existing account.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      setState(() {
        _isLoading = false; // Hide loading animation
      });
      return;
    }

    // Proceed with signup
    final url = Uri.parse('https://dashboard.logic-study.com/api/signup');
    final response = await http.post(
      url,
      body: {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    setState(() {
      _isLoading = false; // Hide loading animation
    });

    return Future.wait([response] as Iterable<Future>).then((responses) {
      if (responses[0].statusCode == 200) {
        // Signup successful, navigate to UniversityScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const PickUniversity()), // Replace with your actual screen
        );
      } else {
        // Signup failed, handle the error accordingly
        // For example, show an error message to the user.
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 18.0),
          child: Text(
            "رجوع",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
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
                  padding: const EdgeInsets.only(left: 190.0, top: 60),
                  child: Text(
                    "انشاء حساب",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    constraints:
                        const BoxConstraints(maxHeight: 49, maxWidth: 373),
                    labelStyle: const TextStyle(fontSize: 14),
                    labelText: "أسم الحساب",
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    constraints:
                        const BoxConstraints(maxHeight: 49, maxWidth: 373),
                    labelStyle: const TextStyle(fontSize: 14),
                    labelText: "البريد الالكتروني",
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    constraints:
                        const BoxConstraints(maxHeight: 49, maxWidth: 373),
                    labelStyle: const TextStyle(fontSize: 14),
                    labelText: "كلمة المرور",
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(fontSize: 14),
                    filled: true,
                    constraints:
                        const BoxConstraints(maxHeight: 49, maxWidth: 373),
                    labelText: "أعد كتابه كلمة المرور",
                    hintText: "أدخل كلمة المرور",
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                if (_passwordsMatchError)
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'كلمة المرور غير متطابقة',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _agreedToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreedToTerms = value ?? false;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'بالتسجيل ، فإنك توافق على الشروط والأحكام وسياسة الخصوصية الخاصة بنا.',
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff0E4F8B),
                  ),
                  width: 373,
                  height: 49,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isLoading = true;
                        });
                        Provider.of<UserController>(context, listen: false).register(_emailController.text, _nameController.text, _passwordController.text, context).then((value) {
                          setState(() {
                            _isLoading=false;
                          });
                        });
                      },
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                            : const Text(
                                'أنشاء حساب',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                      ),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "سجل دخول ",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(" لديك حساب بالفعل ؟"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
