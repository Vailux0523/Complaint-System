import 'package:flutter/material.dart';

class ComplaintDetail extends StatefulWidget {
  final int complaintId; 

  const ComplaintDetail({super.key, required this.complaintId}); 

  @override
  _ComplaintDetailState createState() => _ComplaintDetailState();
}

class _ComplaintDetailState extends State<ComplaintDetail> {
  String? selectedAssignee;
  String? selectedPriority = "High"; // 
  final List<String> assignees = ["Ramesh", "Suresh", "Ganesh"];
  final List<String> priorities = ["High", "Medium", "Low"];

  @override
  void initState() {
    super.initState();
    selectedAssignee = assignees[0]; 
  }

  void _updateComplaint() {
    if (selectedAssignee == null || selectedPriority == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select both assignee and priority")),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Complaint Updated")),
    );
  }
  void _deleteComplaint() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Complaint Deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complaint #${widget.complaintId} Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Title: Water Leakage"),
            const SizedBox(height: 8),
            const Text("Description: Water leakage in the building..."),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedAssignee,
              items: assignees.map((assignee) {
                return DropdownMenuItem(value: assignee, child: Text(assignee));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedAssignee = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedPriority,
              items: priorities.map((priority) {
                return DropdownMenuItem(value: priority, child: Text(priority));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedPriority = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateComplaint, 
              child: const Text("Update Status"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _deleteComplaint, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Delete Complaint"),
            ),
          ],
        ),
      ),
    );
  }
}
