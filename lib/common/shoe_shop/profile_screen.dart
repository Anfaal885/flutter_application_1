import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 0,

        centerTitle: true,

        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 15),

            // PROFILE IMAGE
            const CircleAvatar(
              radius: 55,

          
            ),

            const SizedBox(height: 15),

            const Text(
              'Sara',

              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'sara@example.com',

              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            _profileItem(
              icon: Icons.person_outline,
              title: 'Personal Information',
              onTap: () {},
            ),

            _profileItem(
              icon: Icons.shopping_bag_outlined,
              title: 'My Orders',
              onTap: () {},
            ),

            _profileItem(
              icon: Icons.location_on_outlined,
              title: 'My Address',
              onTap: () {},
            ),

            _profileItem(
              icon: Icons.favorite_border,
              title: 'Wishlist',
              onTap: () {},
            ),

            _profileItem(
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {},
            ),

            _profileItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),

            _profileItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Logout clicked',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),

        borderRadius:
            BorderRadius.circular(15),
      ),

      child: ListTile(
        onTap: onTap,

        leading: Container(
          width: 42,
          height: 42,

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
                BorderRadius.circular(12),
          ),

          child: Icon(
            icon,
            color: Colors.black87,
          ),
        ),

        title: Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}