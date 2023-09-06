// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

List<University> universities = [
  University(
    name: 'الجامعة التكنولوجية',
    location: 'Cambridge, Massachusetts',
    founded: 1636,
    enrollment: 21000,
    knownFor: ['Law', 'Business', 'Medicine'],
  ),
  University(
    name: 'Stanford University',
    location: 'Stanford, California',
    founded: 1885,
    enrollment: 19000,
    knownFor: ['Computer Science', 'Engineering', 'Entrepreneurship'],
  ),
  University(
    name: 'Massachusetts Institute of Technology (MIT)',
    location: 'Cambridge, Massachusetts',
    founded: 1861,
    enrollment: 11000,
    knownFor: [
      'STEM fields',
      'especially Physics',
      'Mathematics',
      'Computer Science'
    ],
  ),
  University(
    name: 'California Institute of Technology (Caltech)',
    location: 'Pasadena, California',
    founded: 1891,
    enrollment: 2200,
    knownFor: ['STEM fields', 'especially Astronomy', 'Physics', 'Chemistry'],
  ),
  University(
    name: 'Princeton University',
    location: 'Princeton, New Jersey',
    founded: 1746,
    enrollment: 8000,
    knownFor: ['Humanities', 'Social Sciences', 'Natural Sciences'],
  ),
  University(
    name: 'Yale University',
    location: 'New Haven, Connecticut',
    founded: 1701,
    enrollment: 13000,
    knownFor: ['Law', 'Medicine', 'Business'],
  ),
  University(
    name: 'Columbia University',
    location: 'New York City, New York',
    founded: 1754,
    enrollment: 33000,
    knownFor: ['Arts and Sciences', 'Engineering', 'Journalism'],
  ),
  University(
    name: 'University of Chicago',
    location: 'Chicago, Illinois',
    founded: 1890,
    enrollment: 16000,
    knownFor: ['Economics', 'Political Science', 'Philosophy'],
  ),
  University(
    name: 'Johns Hopkins University',
    location: 'Baltimore, Maryland',
    founded: 1876,
    enrollment: 20000,
    knownFor: ['Medicine', 'Public Health', 'International Relations'],
  ),
];

class University {
  final String name;
  String location;
  int founded;
  int enrollment;
  List<String> knownFor;

  University(
      {required this.name,
      required this.location,
      required this.founded,
      required this.enrollment,
      required this.knownFor});
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Universities'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: universities.length,
        itemBuilder: (BuildContext context, int index) {
          University university = universities[index];
          return Card(
            child: InkWell(
              onTap: () {
                // Add code here to handle the university selection
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      university.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
