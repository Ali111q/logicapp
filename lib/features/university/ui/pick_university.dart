import 'package:flutter/material.dart';
import 'package:logic_study_app/features/account/settings_screen.dart';
import 'package:logic_study_app/features/university/ui/university_screen.dart';
import 'package:provider/provider.dart';
import '../../../bottom_navigation_provider.dart';
import '../../account/account_screen.dart';
import 'package:logic_study_app/Constants/universities_list.dart';
import 'package:logic_study_app/modals/showmodal_uni.dart';

import '../../courses/courses_screen.dart';

class PickUniversity extends StatelessWidget {
  const PickUniversity({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);
    final selectedItemIndex = bottomNavigationProvider.selectedItemIndex;

    return Scaffold(
      
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          shadowColor: Colors.black,
        ),
        child: BottomNavigationBar(
          enableFeedback: true,
          selectedItemColor:
              Colors.blue, // Set the color of the chosen icon to blue
          elevation: 10,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedItemIndex,
          onTap: (index) {
            bottomNavigationProvider.setSelectedItemIndex(index);
            // Perform navigation based on the selected index
           
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30,
              ),
              label: "الحساب",
              backgroundColor: Colors.grey,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              label: "كورساتي",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Union.png',
                color: selectedItemIndex == 2
                    ? Colors.blue
                    : const Color.fromARGB(255, 104, 104, 104),
              ),
              label: "الجامعة",
            ),
          ],
        ),
      ),
      endDrawer: Container(
        color: Colors.black,
      ),
      backgroundColor: const Color(0xffEFEFF4),
      appBar:selectedItemIndex==0?  AppBar(
        leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            }),
        title: const Text(
          'الملف الشخصي',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ): AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        actions: [
          InkWell(
            onTap: () => showUniversityModalUni(context, []),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/uni_logo.png'),
            ),
          ),
          const SizedBox(width: 18),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Logic Study',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildSelectedScreen(
          selectedItemIndex), // Display the selected screen directly
    );
  }

  Widget _buildSelectedScreen(int selectedItemIndex) {
    switch (selectedItemIndex) {
      case 0:
        return const AccountScreen();
      case 1:
        return const CoursesScreen();
      case 2:
        return UniversityScreen(); // Display the UniversityScreen when the third item is selected
      default:
        return Container();
    }
  }
}
