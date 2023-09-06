import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logic_study_app/Constants/settings_containers.dart';
import 'package:logic_study_app/controller/user_controller.dart';
import 'package:logic_study_app/features/settings/account_edit.dart';
import 'package:logic_study_app/features/welcome_screen/ui/welcome_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              weight: 300,
            )),
        centerTitle: true,
        title: const Text(
          'الاعدادات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(
              height: 1,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 35,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 350.0),
              child: Text(
                'عام',
                style: TextStyle(
                  fontFamily: 'omnes bold',
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsContainers(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountEdit()));
              },
              width2: 210.0,
              text: 'الحساب',
              icon2: Icon(Icons.arrow_back),
              svgPicture: SvgPicture.asset('assets/profile.svg'),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            SettingsContainers(
              width2: 210.0,
              text: 'اللغة',
              icon2: const Icon(Icons.arrow_back),
              svgPicture: SvgPicture.asset('assets/globe.svg'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20, left: 350.0),
              child: Text(
                'اخرى  ',
                style: TextStyle(
                  fontFamily: 'omnes bold',
                  fontSize: 22,
                ),
              ),
            ),
            SettingsContainers(
              width2: 180.0,
              text: 'الاسئلة الشائعة',
              icon2: const Icon(Icons.arrow_back),
              svgPicture: SvgPicture.asset('assets/ques.svg'),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            SettingsContainers(
              width2: 160.0,
              text: 'سياسة الخصوصية ',
              icon2: const Icon(Icons.arrow_back),
              svgPicture: SvgPicture.asset('assets/privacy.svg'),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            SettingsContainers(
              width2: 160.0,
              text: 'الشروط و الأحكام',
              icon2: const Icon(Icons.arrow_back),
              svgPicture: SvgPicture.asset('assets/policy.svg'),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            GestureDetector(
              onTap: ()async{
              await  Provider.of<UserController>(context, listen: false).logout();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context) => WelcomeScreenController(),), (route) => false);
              },
              child: SettingsContainers(
                width2: 170.0,
                text: 'تسجيل الخروج',
                color: Colors.red,
                icon2: const Icon(Icons.logout),
                svgPicture: SvgPicture.asset('assets/logout.svg'),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 200, bottom: 30.0),
              child: Text(style: TextStyle(fontSize: 20), 'ver 2.2.1'),
            ),
          ],
        ),
      ),
    );
  }
}
