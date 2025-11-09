import 'package:flutter/material.dart'; // Import is required for Scaffold and Material widgets
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
    // 1. Wrap the entire screen content in a Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.name),
      ),
      // 2. Wrap the layout logic in a Padding for visual space
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
                maxLines: 2, // Allow more lines for long names
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                // Better formatting for DateTime
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
                maxLines: 2, // Allow rooms to wrap if needed
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),


    );
  }
}