import 'package:flutter/material.dart';

class WorkAssign extends StatefulWidget {
  final String adminName;
  final String adminEmail;
  final String adminMobile;
  final String adminLocation;

  const WorkAssign({
    super.key,
    required this.adminName,
    required this.adminEmail,
    required this.adminMobile,
    required this.adminLocation,
  });

  @override
  State<WorkAssign> createState() => _WorkAssignState();
}

class _WorkAssignState extends State<WorkAssign> {
  List<WorkAssignment> workAssignments = [
    WorkAssignment(
        employeeName: "Ramesh Kumar",
        task: "Prepare marketing materials",
        dueDate: "2024-08-10"),
    WorkAssignment(
        employeeName: "Ganesh Marthe",
        task: "Develop new website features",
        dueDate: "2024-08-15"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Assignment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${widget.adminName}', 
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Email: ${widget.adminEmail}'),
            Text('Mobile: ${widget.adminMobile}'),
            Text('Location: ${widget.adminLocation}'),

            const SizedBox(height: 20),
            Expanded( 
              child: ListView.builder(
                itemCount: workAssignments.length,
                itemBuilder: (context, index) {
                  final assignment = workAssignments[index];
                  return Card(
                    child: ListTile(
                      title: Text(assignment.task),
                      subtitle: Text(
                          'Assigned to: ${assignment.employeeName}\nDue Date: ${assignment.dueDate}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class WorkAssignment {
  final String employeeName;
  final String task;
  final String dueDate;

  WorkAssignment({
    required this.employeeName,
    required this.task,
    required this.dueDate,
  });
}