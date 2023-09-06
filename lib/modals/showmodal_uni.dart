// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:logic_study_app/controller/collage_controller.dart';
import 'package:logic_study_app/modals/showmodal_college.dart';
import 'package:provider/provider.dart';

import '../model/university.dart';

void showUniversityModalUni(
    BuildContext context, List<University> universities) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return UniversityBottomSheet();
    },
  );
}

class UniversityBottomSheet extends StatelessWidget {
  const UniversityBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      widthFactor: 1,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'اختر الجامعة التي تدرس فيها', // Title for the GridView
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<CollageController>(context).getUniversities(),
                builder: (context , snapshot ) {
                  if (snapshot.hasError) {
                    return Text('حصل خطأ ما');
                  }
                  if (snapshot.data ==null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  
                  return GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 3,
                    ),
                   children: [
                   ...snapshot.data!.map((e) => UniversityBottomSheetWidget(university: e))
                   ],
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UniversityBottomSheetWidget extends StatelessWidget {
  const UniversityBottomSheetWidget({
    super.key,
    required this.university,
  });

  final University university;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Color.fromARGB(160, 239, 239, 244),
          elevation: 0,
          margin: EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
            showUniversityModalCollege(context, []);
            },
            child: Image.asset(
              'assets/uni_logo2.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          child: Text(
            university.name,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
