import 'package:flutter/material.dart';
import 'complaint_detail.dart';

class ComplaintsList extends StatefulWidget {
  const ComplaintsList({super.key});

  @override
  _ComplaintsListState createState() => _ComplaintsListState();
}

class _ComplaintsListState extends State<ComplaintsList> {
  final List<String> cities = ["Ahemdabad", "botad", "Surat"];
  final List<String> statuses = ["Pending", "In Progress", "Resolved"];
  String? selectedCity;
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaints"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => showFilterDialog(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text("Complaint #$index", style: const TextStyle(fontSize: 18)),
              subtitle: const Text("Status: Pending", style: TextStyle(color: Colors.orange)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComplaintDetail(complaintId: index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Filter Complaints"),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: selectedCity,
                    items: cities.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                    hint: const Text("Select City"),
                  ),
                  DropdownButton<String>(
                    value: selectedStatus,
                    items: statuses.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                    hint: const Text("Select Status"),
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  
                });
                Navigator.pop(context); 
              },
              child: const Text("Apply Filters"),
            ),
          ],
        );
      },
    );
  }
}
