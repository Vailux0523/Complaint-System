import 'package:flutter/material.dart';

class CategoryPriorityManagement extends StatefulWidget {
  const CategoryPriorityManagement({super.key});

  @override
  _CategoryPriorityManagementState createState() => _CategoryPriorityManagementState();
}

class _CategoryPriorityManagementState extends State<CategoryPriorityManagement> {
  final List<String> categories = ["Plumbing", "Electricity", "Cleaning"];
  final List<String> priorities = ["High", "Medium", "Low"];
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  void _editCategoryPriority(int index) {
    _categoryController.text = categories[index];
    _priorityController.text = priorities[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Category & Priority'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: _priorityController,
                decoration: const InputDecoration(labelText: 'Priority'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  categories[index] = _categoryController.text;
                  priorities[index] = _priorityController.text;
                });
                Navigator.pop(context); 
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Categories & Priorities"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            subtitle: Text(priorities[index]),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                _editCategoryPriority(index); 
              },
            ),
          );
        },
      ),
    );
  }
}
