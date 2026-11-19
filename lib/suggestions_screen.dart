import 'package:flutter/material.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggestions"),
      ),
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              const Text(
                'Suggestion Box: 45', 
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('View Suggestions Pressed')),
                  );
                },
                child: const Text('View Suggestions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}