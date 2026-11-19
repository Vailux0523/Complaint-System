import 'package:flutter/material.dart';

class ResolvedComplaintsScreen extends StatelessWidget {
  const ResolvedComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resolved Complaints")),
      body: const Center(child: Text("Resolved Complaints Screen Content")),
    );
  }
}