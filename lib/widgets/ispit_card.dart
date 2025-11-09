import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/examdetailscreen.dart';

class CardExample extends StatelessWidget{
  final Exam exam;
  const CardExample({required this.exam,super.key});

  Color getCardColor(DateTime examtime){
    final isUpcoming = examtime.isAfter(DateTime.now());
    if(isUpcoming){
      return Colors.green.shade50;
    }
    else{
      return Colors.red.shade50;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = getCardColor(exam.timeOfExam);
    return Center(
      child: Card(
        color: cardColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => ExamDetailScreen(exam: exam)),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(exam.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Date: ${exam.timeOfExam.year}-${exam.timeOfExam.month}-${exam.timeOfExam.day}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        'Time: ${exam.timeOfExam.hour}:${exam.timeOfExam.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.meeting_room,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            'Простории: ${exam.rooms.join(', ')}',
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}