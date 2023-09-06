import 'package:flutter/material.dart';
import 'package:logic_study_app/model/course.dart';
import 'package:logic_study_app/view/course_screen.dart';

class CoursesContainer extends StatelessWidget {
  const CoursesContainer({super.key, required this.course});
  final Course course;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => CourseScreen(videos: course.videos,),));
      },
      child: Container(
        height: 140,
        width: 383,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(course.image, fit: BoxFit.cover),
               Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Text(
                  textDirection: TextDirection.rtl,
                  course.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
