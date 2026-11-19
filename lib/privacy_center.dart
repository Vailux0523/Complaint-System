import 'package:flutter/material.dart';

class PrivacyCenter extends StatelessWidget {
  const PrivacyCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Center")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Terms & Conditions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "1. All complaints will be reviewed by the admin.\n"
              "2. Admin has the right to resolve, reject, or forward complaints.\n"
              "3. User information will be stored securely.\n"
              "4. The app may change its terms at any time.\n",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
