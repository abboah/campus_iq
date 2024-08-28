import 'package:flutter/material.dart';

class CoursesTabWidget extends StatelessWidget {
  final Color color;
  final TextStyle? textStyle;
  const CoursesTabWidget(
      {super.key, required this.color, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    List<String> courselist = [
      'CSM 290 - Analogue and Digital Electronics',
      'CSM 265 - Programming With Assembly Language',
      'CSM 292 - Database Concept And Technologies II',
      'ENGL 256',
      'CSM 266',
      'CSM 252',
      'CSM 268',
      'CSM 254',
    ];

    List<Color> colorlistlight = [
      Colors.amber,
      Colors.red,
      Colors.blue,
      Colors.cyan,
      Colors.pink,
      Colors.orange,
      Colors.teal,
      Colors.indigo,
      Colors.amber,
      Colors.red,
      Colors.blue,
      Colors.cyan,
      Colors.pink,
    ];

    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      itemCount: courselist.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: colorlistlight[index], width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            onTap: () {},
            title: Text(
              courselist[index],
              style: textStyle,
            ),
          ),
        );
      },
    );
  }
}
