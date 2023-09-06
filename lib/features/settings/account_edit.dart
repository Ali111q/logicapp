import 'package:flutter/material.dart';
import 'package:logic_study_app/Constants/text_fields.dart';

class AccountEdit extends StatelessWidget {
  const AccountEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(),
        title:
            const Text(style: TextStyle(fontWeight: FontWeight.bold), 'الحساب'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              heightFactor: 1.2,
              child: Image.asset(
                "assets/frame.png",
                width: 70,
                height: 72.5,
              ),
            ),
            const Divider(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 330.0, bottom: 10),
              child: Text(
                'الاسم',
                style: TextStyle(
                    fontFamily: 'omnes ',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldCustom(
              labeltext:
                  '                                                                                                          الاسم',
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 290.0, bottom: 10),
              child: Text(
                'كلمة المرور',
                style: TextStyle(
                    fontFamily: 'omnes ',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldCustom(
              labeltext:
                  '                                                                              كلمة المرور القديمة',
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              labeltext:
                  '                                                                              كلمة المرور الجديدة',
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              labeltext:
                  '                                                         اعد كتابة كلمة المرور الجديدة',
            ),
            SizedBox(
              height: 170,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              width: 373,
              height: 49,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'حذف الحساب',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 10),
                'حذف الحساب يعني أنه سيتم حذف كل الاشتراكات و بيانات الحساب و كل ما يتعلق بهِ')
          ],
        ),
      ),
    );
  }
}
