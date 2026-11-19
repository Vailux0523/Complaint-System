import 'package:flutter/material.dart';

class PendingComplaintsScreen extends StatelessWidget {
  const PendingComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pending Complaints")),
      body: const Center(child: Text("Pending Complaints Screen Content")), 
    );
  }
}