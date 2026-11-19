import 'package:flutter/material.dart';
import 'complaint_detail.dart';

class Complaint {
  final int id;
  final String title;
  final String description;
  final String status;

  Complaint({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });
}

class TotalComplaintsScreen extends StatelessWidget {
   TotalComplaintsScreen({super.key});
  final List<Complaint> complaints = [
    Complaint(id: 1, title: "Leaky Faucet", description: "Water leakage in kitchen", status: "Pending"),
    Complaint(id: 2, title: "Broken Light", description: "Living room light not working", status: "In Progress"),
    Complaint(id: 3, title: "Clogged Drain", description: "Bathroom sink is clogged", status: "Resolved"),
    Complaint(id: 4, title: "No Internet", description: "WiFi not working in the office", status: "Pending"),
    Complaint(id: 5, title: "AC Not Cooling", description: "Air conditioner issue in bedroom", status: "Resolved"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total Complaints"),
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final complaint = complaints[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(complaint.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(complaint.description, style: const TextStyle(color: Colors.grey)),
              trailing: _getStatusWidget(complaint.status),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComplaintDetail(complaintId: complaint.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
  Widget _getStatusWidget(String status) {
    Color statusColor;
    switch (status) {
      case "Pending":
        statusColor = Colors.orange;
        break;
      case "In Progress":
        statusColor = Colors.blue;
        break;
      case "Resolved":
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.black;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
