import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Welcome to Admin Dashboard',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildWideCard(context, 'Wages Paid', Icons.supervised_user_circle, Colors.green, UserManagementScreen()),
              _buildWideCard(context, 'Reports', Icons.bar_chart, Colors.blue, ReportsScreen()),
              _buildWideCard(context, 'Settings', Icons.settings, Colors.orange, SettingsScreen()),
              _buildWideCard(context, 'Notifications', Icons.notifications, Colors.red, NotificationsScreen()),
              _buildWideCard(context, 'System Logs', Icons.receipt, Colors.purple, SystemLogsScreen()),
              _buildWideCard(context, 'Backup', Icons.backup, Colors.cyan, BackupScreen()),
              _buildWideCard(context, 'Activity', Icons.history, Colors.yellow, ActivityScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWideCard(BuildContext context, String title, IconData icon, Color color, Widget screen) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class UserManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Management')),
      body: Center(child: Text('Manage users here')),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports')),
      body: Center(child: Text('View and generate reports here')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Configure app settings here')),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(child: Text('Manage notifications here')),
    );
  }
}

class SystemLogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('System Logs')),
      body: Center(child: Text('View system logs here')),
    );
  }
}

class BackupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Backup')),
      body: Center(child: Text('Backup system data here')),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activity')),
      body: Center(child: Text('View user activity logs here')),
    );
  }
}

