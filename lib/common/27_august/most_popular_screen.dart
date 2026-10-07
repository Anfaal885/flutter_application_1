import 'package:flutter/material.dart';
import 'digital_safety_screen.dart';

class MostPopularScreen extends StatefulWidget {
  const MostPopularScreen({super.key});

  @override
  State<MostPopularScreen> createState() =>
      _MostPopularScreenState();
}

class _MostPopularScreenState
    extends State<MostPopularScreen> {

  int selectedPlan = 1;

  static const Color selectedColor =
      Color(0xff4036D8);

  static const Color normalColor =
      Color(0xff777777);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- TITLE ----------------

            const SizedBox(height: 15),

            const Text(
              'Most popular',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 25),

            // ---------------- PLANS ----------------

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                planButton('Silver', 0),
                planButton('Gold', 1),
                planButton('Platinum', 2),
              ],
            ),

            const SizedBox(height: 25),

            // ---------------- CONTENT ----------------

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 78,
                      color: Color(0xffd2c8a7),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'Unlimited Place Alerts',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: Text(
                        'Get notified as circle members come and go\n'
                        'from any place you add.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.5,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // PRICE
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 19,
                            vertical: 13,
                          ),
                          decoration: BoxDecoration(
                            color: selectedColor,
                            borderRadius:
                                BorderRadius.circular(22),
                          ),
                          child: const Text(
                            'BDT 999.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(width: 45),

                        const Text(
                          'BDT 8,500.00',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 38),

                    const Text(
                      'Life360 Team and Privacy Policy',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      '7 day trial then billed automatically '
                      'BDT 999.00/\n'
                      'month. Cancel anytime.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),
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
                      // Location screen
                    },
                  ),

                  // DRIVING
                  bottomNavItem(
                    context: context,
                    icon: Icons.directions_car_outlined,
                    title: 'Driving',
                    selected: false,
                    onTap: () {
                      // Driving screen
                    },
                  ),

                  // SAFETY
                  bottomNavItem(
                    context: context,
                    icon: Icons.shield_outlined,
                    title: 'Safety',
                    selected: false,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DigitalSafetyScreen(),
                        ),
                      );
                    },
                  ),

                  // MEMBERSHIP - SELECTED
                  bottomNavItem(
                    context: context,
                    icon: Icons.settings,
                    title: 'Membership',
                    selected: true,
                    onTap: () {
                      // Already Membership screen
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

  // ---------------- PLAN BUTTON ----------------

  Widget planButton(
    String title,
    int index,
  ) {
    final bool selected = selectedPlan == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected
              ? selectedColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected
                ? Colors.white
                : normalColor,
            fontSize: 11,
            fontWeight: selected
                ? FontWeight.w600
                : FontWeight.normal,
          ),
        ),
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