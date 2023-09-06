// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logic_study_app/modals/show_modal_college_container.dart';
import 'package:logic_study_app/Constants/universities_list.dart';

void showUniversityModalVLevel(
    BuildContext context, List<University> universities) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 1,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                        )),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'اختر المرحلة', // Title for the GridView
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(children: [
                    SizedBox(
                      height: 80,
                    ),
                    CollegeChoices(college: 'اولى'),
                    SizedBox(
                      height: 10,
                    ),
                    CollegeChoices(college: "ثانية"),
                    SizedBox(
                      height: 10,
                    ),
                    CollegeChoices(college: "ثالثة"),
                    SizedBox(
                      height: 10,
                    ),
                    CollegeChoices(college: "رابعة"),
                    SizedBox(
                      height: 10,
                    ),
                    CollegeChoices(college: "خامسة"),
                    SizedBox(
                      height: 10,
                    ),
                    CollegeChoices(college: "سادسة"),
                  ]),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
