import 'package:flutter/material.dart';
import 'appointments_screen.dart';

class ChooseSpecialistScreen extends StatelessWidget {
  const ChooseSpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [

              // =====================================================
              // TOP PROFILE
              // =====================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  18,
                  22,
                  0,
                ),
                child: Row(
                  children: [

                    // Profile Picture
                    const CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning!',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Martin Butler',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF151B35),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Notification
                    Container(
                      width: 47,
                      height: 47,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.notifications_none,
                              color: Color(0xFF20263D),
                              size: 24,
                            ),
                          ),

                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // =====================================================
              // HEADING
              // =====================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  28,
                  22,
                  0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Expanded(
                      child: Text(
                        'Choose Your\nSpecialist',
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.08,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF11162F),
                        ),
                      ),
                    ),

                    // Search Button
                    Container(
                      width: 51,
                      height: 51,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1859E8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // =====================================================
              // SPECIALIST CATEGORIES
              // =====================================================
              SizedBox(
                height: 43,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  children: [

                    categoryItem(
                      title: 'All',
                      icon: Icons.apps,
                      selected: true,
                    ),

                    categoryItem(
                      title: 'Therapist',
                      icon: Icons.hearing,
                      selected: false,
                    ),

                    categoryItem(
                      title: 'Urologist',
                      icon: Icons.accessibility_new,
                      selected: false,
                    ),

                    categoryItem(
                      title: 'Cardiologist',
                      icon: Icons.favorite_border,
                      selected: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 19),

              // =====================================================
              // DR. ETHAN BROOKS CARD
              // =====================================================
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AppointmentsScreen(),
                      ),
                    );
                  },

                  child: Container(
                    width: double.infinity,
                    height: screenWidth < 380 ? 270 : 290,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),

                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF0878E8),
                          Color(0xFF168FDC),
                        ],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.12),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    clipBehavior: Clip.hardEdge,

                    child: Stack(
                      children: [

                        // =================================================
                        // DOCTOR IMAGE
                        // =================================================
                        Positioned(
                          right: -8,
                          bottom: 0,

                          child: SizedBox(
                            width: screenWidth < 380
                                ? 195
                                : 225,

                            height: screenWidth < 380
                                ? 225
                                : 255,

                            child: Image.network(
                              'https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=600&q=90',

                              fit: BoxFit.cover,

                              alignment: Alignment.topCenter,

                              errorBuilder:
                                  (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 100,
                                );
                              },
                            ),
                          ),
                        ),

                        // =================================================
                        // RATING
                        // =================================================
                        Positioned(
                          top: 18,
                          left: 18,

                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 7,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withValues(alpha: 0.18),

                              borderRadius:
                                  BorderRadius.circular(20),
                            ),

                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),

                                SizedBox(width: 4),

                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // =================================================
                        // FAVORITE HEART
                        // =================================================
                        Positioned(
                          top: 18,
                          right: 18,

                          child: Container(
                            width: 40,
                            height: 40,

                            decoration:
                                const BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle,
                            ),

                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),

                        // =================================================
                        // DOCTOR TEXT
                        // =================================================
                        Positioned(
                          left: 18,
                          top: 82,

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              const Text(
                                'Cardiologist',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                'Dr. Ethan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  height: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const Text(
                                'Brooks',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  height: 1.15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // =================================================
                        // BOOK NOW BUTTON
                        // =================================================
                        Positioned(
                          left: 18,
                          bottom: 18,

                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AppointmentsScreen(),
                                ),
                              );
                            },

                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 19,
                                vertical: 12,
                              ),

                              decoration: BoxDecoration(
                                color: const Color(0xFF101522),
                                borderRadius:
                                    BorderRadius.circular(25),

                                border: Border.all(
                                  color: Colors.white
                                      .withValues(alpha: 0.15),
                                ),
                              ),

                              child: const Text(
                                'Book Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // =====================================================
              // BOTTOM NAVIGATION
              // =====================================================
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),

                height: 64,

                decoration: BoxDecoration(
                  color: const Color(0xFF101A2B),
                  borderRadius: BorderRadius.circular(35),
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                  children: [

                    // HOME SELECTED
                    navIcon(
                      Icons.home_outlined,
                      true,
                    ),

                    // SEARCH
                    navIcon(
                      Icons.search,
                      false,
                    ),

                    // CALENDAR
                    navIcon(
                      Icons.calendar_month_outlined,
                      false,
                    ),

                    // PROFILE
                    navIcon(
                      Icons.person_outline,
                      false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CATEGORY ITEM
  // ============================================================
  Widget categoryItem({
    required String title,
    required IconData icon,
    required bool selected,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),

      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFF1859E8)
            : Colors.transparent,

        borderRadius: BorderRadius.circular(23),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Icon(
            icon,
            size: 16,
            color: selected
                ? Colors.white
                : Colors.grey,
          ),

          const SizedBox(width: 5),

          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: selected
                  ? Colors.white
                  : Colors.grey,
              fontWeight: selected
                  ? FontWeight.w500
                  : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM NAV ICON
  // ============================================================
  Widget navIcon(
    IconData icon,
    bool selected,
  ) {
    return Container(
      width: 48,
      height: 48,

      decoration: BoxDecoration(
        color: selected
            ? Colors.white
            : Colors.transparent,

        shape: BoxShape.circle,
      ),

      child: Icon(
        icon,

        color: selected
            ? const Color(0xFF20263D)
            : Colors.white,

        size: 22,
      ),
    );
  }
}