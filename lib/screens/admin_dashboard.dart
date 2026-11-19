import 'package:complaintapp/admin_drawer_screen.dart';
import 'package:complaintapp/pending_complaints_screen.dart';
import 'package:complaintapp/resolved_complaint_screen.dart';
import 'package:complaintapp/services/wages_screen.dart';
import 'package:complaintapp/suggestions_screen.dart';
import 'package:complaintapp/total_complaints_screen.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  final String adminName;
  final String adminEmail;
  final String adminMobile;
  final String adminLocation;
  final String profileImageUrl; // Added for profile image

  const AdminDashboard({
    super.key,
    required this.adminName,
    required this.adminEmail,
    required this.adminMobile,
    required this.adminLocation,
    this.profileImageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    List<DashboardItem> dashboardItems = [
      DashboardItem('Total Complaints', '120', Icons.report_problem, Colors.orange, TotalComplaintsScreen()),
      DashboardItem('Pending Complaints', '30', Icons.pending_actions, Colors.blue, PendingComplaintsScreen()),
      DashboardItem('Resolved Complaints', '90', Icons.check_circle_outline, Colors.green, ResolvedComplaintsScreen()),
      DashboardItem('Suggestions', '45', Icons.feedback, Colors.purple, SuggestionsScreen()),
      DashboardItem('Paid Wages', '45', Icons.attach_money, Colors.pinkAccent, WagesPaidScreen()),
      DashboardItem('Work Assign', '45', Icons.work, Colors.blue, SuggestionsScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: AdminDrawer(
        adminName: adminName,
        adminEmail: adminEmail,
        adminMobile: adminMobile,
        adminLocation: adminLocation,
        profileImageUrl: profileImageUrl,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // Square cards
          ),
          itemCount: dashboardItems.length,
          itemBuilder: (context, index) {
            return _buildGridItem(context, dashboardItems[index]);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, DashboardItem item) {
    return Card(
      color: item.color.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => item.screen));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              item.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              item.count,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final String count;
  final IconData icon;
  final Color color;
  final Widget screen;

  DashboardItem(this.title, this.count, this.icon, this.color, this.screen);
}
