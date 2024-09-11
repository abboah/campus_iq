import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/widgets/gradient_textbutton.dart';

class ConfirmCoursesScreen extends StatefulWidget {
  @override
  _ConfirmCoursesScreenState createState() => _ConfirmCoursesScreenState();
}

class _ConfirmCoursesScreenState extends State<ConfirmCoursesScreen> {
  List<Course> courses = [
    Course('CSC101', 'Introduction to Computer Science'),
    Course('MTH102', 'Calculus II'),
    // Add more courses
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Confirm Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseItem(
            course: courses[index],
            onEdit: (updatedCourse) {
              setState(() {
                courses[index] = updatedCourse;
              });
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Button(
            onPressed: () {
              // function to process images
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ConfirmCoursesScreen()));
            },
            text: 'Confirm'),
      ),
    );
  }
}

class CourseItem extends StatefulWidget {
  final Course course;
  final ValueChanged<Course> onEdit;

  CourseItem({required this.course, required this.onEdit});

  @override
  _CourseItemState createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  bool isEditing = false;
  late TextEditingController courseCodeController;
  late TextEditingController courseNameController;

  @override
  void initState() {
    super.initState();
    courseCodeController = TextEditingController(text: widget.course.code);
    courseNameController = TextEditingController(text: widget.course.name);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListTile(
        title: isEditing
            ? TextField(
                controller: courseCodeController,
                decoration: InputDecoration(labelText: 'Course Code'),
              )
            : Text(widget.course.code),
        subtitle: isEditing
            ? TextField(
                controller: courseNameController,
                decoration: InputDecoration(labelText: 'Course Name'),
              )
            : Text(widget.course.name),
        trailing: IconButton(
          icon: Icon(isEditing ? Icons.check : IconlyLight.edit),
          onPressed: () {
            if (isEditing) {
              widget.onEdit(
                  Course(courseCodeController.text, courseNameController.text));
            }
            setState(() {
              isEditing = !isEditing;
            });
          },
        ),
      ),
    );
  }
}

class Course {
  String code;
  String name;

  Course(this.code, this.name);
}
