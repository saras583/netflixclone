import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body:SafeArea(child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
          
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 30),
          
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.person,
                  size: 55,
                  color: Colors.white,
                ),
              ),
          
              const SizedBox(height: 15),
          
              const Text(
                'Saras',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 20),
          
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Manage Profiles',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              ProfileMenuItem(
            icon: Icons.notifications_none,
            title: 'Notifications',
          ),
          
          ProfileMenuItem(
            icon: Icons.format_list_bulleted,
            title: 'My List',
          ),
          
          ProfileMenuItem(
            icon: Icons.settings_outlined,
            title: 'App Settings',
          ),
          
          ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'Account',
          ),
          
          ProfileMenuItem(
            icon: Icons.help_outline,
            title: 'Help',
          ),
            ],
            
          ),
        ),
        
      ),)
    );
  }
}
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF494344),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        leading: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: 32,
        ),
        onTap: () {},
      ),
    );
  }
}