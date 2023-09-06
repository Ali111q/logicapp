import 'package:flutter/material.dart';
import 'package:logic_study_app/Constants/courses_page_container.dart';
import 'package:logic_study_app/Constants/universities_list.dart';
import 'package:logic_study_app/controller/collage_controller.dart';
import 'package:logic_study_app/modals/showmodal_uni.dart';
import 'package:logic_study_app/model/collage.dart';
import 'package:provider/provider.dart';

class UniversityScreen extends StatelessWidget {
  const UniversityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFF4),
      body: FutureBuilder(
          future: Provider.of<CollageController>(context).getCourses(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('حصل خطأ ما');
            }
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      ...snapshot.data!.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CoursesContainer(
                            course: e,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
