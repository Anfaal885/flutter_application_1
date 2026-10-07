import 'package:flutter/material.dart';
import 'most_popular_screen.dart';

class DigitalSafetyScreen extends StatelessWidget {
  const DigitalSafetyScreen({super.key});

  static const Color selectedColor = Color(0xff4036D8);
  static const Color normalColor = Color(0xff777777);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- TOP BAR ----------------

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 17,
                    ),
                  ),

                  const Spacer(),

                  const Icon(
                    Icons.favorite_border,
                    size: 22,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 25),

                  const Icon(
                    Icons.share_outlined,
                    size: 21,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            // ---------------- CONTENT ----------------

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),

                    const Text(
                      'Digital Safety',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // DATA BREACH ALERTS
                    safetyItem(
                      icon: Icons.laptop_outlined,
                      title: 'Data Breach Alerts',
                      description:
                          'Turn on alerts to protect your\n'
                          'whole family online.',
                      bottomText: 'Free',
                    ),

                    // ID THEFT PROTECTION
                    safetyItem(
                      icon: Icons.fingerprint,
                      title: 'ID Theft Protection',
                      description:
                          'Add \$25k USD reimbursement\n'
                          'of stolen funds and more.',
                      bottomText: 'Gold',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeThumbColor: selectedColor,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Driving Safety',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // CRASH ALERTS
                    safetyItem(
                      icon: Icons.directions_car_outlined,
                      title: 'Crash Alerts',
                      description:
                          'Turn on alerts to be notified\n'
                          'if a family gets accident.',
                      bottomText: 'Gold',
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),

            // ---------------- BOTTOM NAV ----------------

            Container(
              height: 72,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffeeeeee),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  // LOCATION
                  bottomNavItem(
                    context: context,
                    icon: Icons.location_on_outlined,
                    title: 'Location',
                    selected: false,
                    onTap: () {
                      // Location screen yahan add hogi
                    },
                  ),

                  // DRIVING
                  bottomNavItem(
                    context: context,
                    icon: Icons.directions_car_outlined,
                    title: 'Driving',
                    selected: false,
                    onTap: () {
                      // Driving screen yahan add hogi
                    },
                  ),

                  // SAFETY - SELECTED
                  bottomNavItem(
                    context: context,
                    icon: Icons.shield_outlined,
                    title: 'Safety',
                    selected: true,
                    onTap: () {
                      // Already Safety screen par hain
                    },
                  ),

                  // MEMBERSHIP
                  bottomNavItem(
                    context: context,
                    icon: Icons.settings_outlined,
                    title: 'Membership',
                    selected: false,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MostPopularScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- SAFETY ITEM ----------------

  Widget safetyItem({
    required IconData icon,
    required String title,
    required String description,
    String? bottomText,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.black87,
          ),

          const SizedBox(width: 17),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    if (trailing != null) trailing,
                  ],
                ),

                const SizedBox(height: 7),

                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11.5,
                    height: 1.35,
                  ),
                ),

                if (bottomText != null) ...[
                  const SizedBox(height: 8),

                  Text(
                    bottomText,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- BOTTOM NAV ITEM ----------------

  Widget bottomNavItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 72,
        height: 65,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected
                  ? selectedColor
                  : normalColor,
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: TextStyle(
                fontSize: 9,
                fontWeight: selected
                    ? FontWeight.w600
                    : FontWeight.normal,
                color: selected
                    ? selectedColor
                    : normalColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}