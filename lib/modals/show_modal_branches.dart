// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logic_study_app/controller/collage_controller.dart';
import 'package:logic_study_app/modals/show_modal_college_container.dart';
import 'package:logic_study_app/Constants/universities_list.dart';
import 'package:logic_study_app/modals/show_modal_studies.dart';
import 'package:provider/provider.dart';

void showUniversityModalVBranches(
    BuildContext context, List branches) {
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
                      'اختر الفرع', // Title for the GridView
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
                  
                    FutureBuilder(
                      future: Provider.of<CollageController>(context).getCBranches(branches: branches),
                      builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                    return Text('حصل خطأ ما');
                  }
                  if (snapshot.data ==null) {
                    return Center(child: CircularProgressIndicator());
                  }
                       return Column(children: [
                        ...snapshot.data!.map((e) {
                           return Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: CollegeChoices(
                              college: e.name,
                              ontap: () {
                                showUniversityModalVStudy(context, universities);
                              }),
                           );
                        })
                       ],);
                      }
                    ),
                   
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
