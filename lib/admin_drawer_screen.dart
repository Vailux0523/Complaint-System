import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:complaintapp/screens/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:complaintapp/profile_screen.dart';
import 'package:complaintapp/total_complaints_screen.dart';

class AdminDrawer extends StatelessWidget {
  final String adminName;
  final String adminEmail;
  final String adminMobile;
  final String adminLocation;
  final String profileImageUrl; 

  const AdminDrawer({
    super.key,
    required this.adminName,
    required this.adminEmail,
    required this.adminMobile,
    required this.adminLocation,
    required this.profileImageUrl, 
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: themeProvider.themeMode == ThemeMode.dark
                  ? Colors.grey[900]
                  : Colors.blue,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(profileImageUrl), 
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      adminName,
                      style: TextStyle(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? Colors.white
                            : Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      adminEmail,
                      style: TextStyle(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? Colors.white
                            : Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    currentName: adminName,
                    currentEmail: adminEmail,
                    currentMobile: adminMobile,
                    currentLocation: adminLocation,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Total Complaints"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TotalComplaintsScreen()),
              );
            },
          ),
          const Divider(),
          SwitchListTile(
            title: Text(themeProvider.themeMode == ThemeMode.dark
                ? "Switch to Light Mode"
                : "Switch to Dark Mode"),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.clear();
                        Navigator.of(context).pop();
                        Navigator.pushReplacementNamed(context, '/splash_screen');
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
