import 'package:flutter/material.dart';
import 'package:logic_study_app/controller/user_controller.dart';
import 'package:logic_study_app/features/account/settings_screen.dart';
import 'package:logic_study_app/model/user.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserController _userController = Provider.of<UserController>(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/mask.png'),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Center(child: CircleAvatar(
                  radius: 35,
                  
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32,),)),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
           Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Divider(),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                _userController.user!.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(child: Divider()),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
           Text(
            _userController.user!.email,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffe9e9e9),
                borderRadius: BorderRadius.circular(10)),
            width: 382,
            height: 78,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Column(
                      children: [
                        Text(
                          'الجامعة التكنولوجية   ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'كلية الهندسة الميكانيكية     ',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text('                 فرع الطائرات',
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ],
                    ),
                    Image.asset(
                      'assets/uni_logo2.png',
                      fit: BoxFit.fitHeight,
                      width: 50,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 320.0),
            child: Text(
              'اشتراكاتك',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffe9e9e9),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 1))],
                borderRadius: BorderRadius.circular(10)),
            height: 86,
            width: 390,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'كورس مقاومة مواد - متقدم - #3D   ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '                                           مرحلة ثانية',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('                        فعال لغاية: ٢٠٢٣/١٢/١',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/thump.png',
                    width: 136,
                    height: 77,
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffe9e9e9),
                borderRadius: BorderRadius.circular(10)),
            height: 86,
            width: 390,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'كورس مقاومة مواد - متقدم - #3D   ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '                                           مرحلة ثانية',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('                        فعال لغاية: ٢٠٢٣/١٢/١',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/thump.png',
                    width: 136,
                    height: 77,
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
