import 'package:flutter/material.dart';

class Semesters extends StatefulWidget {
  @override
  _SemestersState createState() => _SemestersState();
}

class _SemestersState extends State<Semesters> {
  List<String> semester = [
    'Current Semester',
    '1st Semester',
    '2nd semester',
    '3rd Semester',
    '4th Semester',
    '5th Semester',
    '6th Semester',
    '7th Semester',
    '8th Semester',
  ];
  //By default current semester is selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: semester.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.black45, Colors.white],
                        ),
                      ),
                      child: Text(
                        semester[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.white54,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 4,
                      width: 90,
                      color: selectedIndex == index
                          ? Colors.green
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
