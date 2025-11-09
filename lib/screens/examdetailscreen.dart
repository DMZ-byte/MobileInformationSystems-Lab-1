import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  ExamDetailScreen({
    required this.exam,
    super.key,
  });


  final now = DateTime.now();
  late var difference =  exam.timeOfExam.difference(now);
  late var days = difference.inDays;
  late var hours = difference.inHours %24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.name),
      ),
      body:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                exam.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(

                'Date: ${exam.timeOfExam.year}-${exam.timeOfExam.month}-${exam.timeOfExam.day}\nTime: ${exam.timeOfExam.hour}:${exam.timeOfExam.minute.toString().padLeft(2, '0')}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Time Remaining: ${days} days and $hours hours.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Rooms:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                exam.rooms.join(", "),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),


    );
  }
}