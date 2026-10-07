import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() =>
      _AppointmentsScreenState();
}

class _AppointmentsScreenState
    extends State<AppointmentsScreen> {
  int selectedDay = 2;
  int selectedTime = 3;

  final List<String> days = [
    'Mon',
    'Tue',
    'Wed',
    'Thr',
    'Fri',
    'Sat',
  ];

  final List<String> dates = [
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
  ];

  final List<String> times = [
    '8:00',
    '9:00',
    '10:00',
    '11:00',
    '12:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [

              const SizedBox(height: 15),

              // ==============================
              // BACK BUTTON + TITLE
              // ==============================
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Row(
                  children: [

                    // BACK BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 22,
                        ),
                      ),
                    ),

                    // TITLE
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Appointments',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // RIGHT SIDE SPACE
                    const SizedBox(
                      width: 45,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              // SUBTITLE
              const Text(
                'Select a specialist',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 25),

              // ==============================
              // BOOK / UPCOMING TABS
              // ==============================
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1859E8),
                          borderRadius:
                              BorderRadius.circular(27),
                        ),
                        child: const Center(
                          child: Text(
                            'Book a Doctor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const Expanded(
                      child: Center(
                        child: Text(
                          'Upcoming',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ==============================
              // DOCTOR INFORMATION
              // ==============================
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [

                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=200&q=80',
                      ),
                    ),

                    const SizedBox(width: 13),

                    const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          'Dr. Ethan Brooks',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Row(
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
                                fontSize: 12,
                              ),
                            ),

                            Text(
                              '  •  Cardiologist',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ==============================
              // APPOINTMENT SLOT
              // ==============================
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Appointment slot',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 17),

              // ==============================
              // DAYS
              // ==============================
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  itemCount: days.length,
                  itemBuilder: (context, index) {

                    bool selected =
                        selectedDay == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDay = index;
                        });
                      },
                      child: Container(
                        width: 54,
                        margin: const EdgeInsets.only(
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFF1859E8)
                              : Colors.white,
                          borderRadius:
                              BorderRadius.circular(17),
                          border: Border.all(
                            color: selected
                                ? Colors.transparent
                                : const Color(0xFFE6E8EF),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [

                            Text(
                              days[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: selected
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 7),

                            Text(
                              dates[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: selected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ==============================
              // TIME SLOTS
              // ==============================
              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  itemCount: times.length,
                  itemBuilder: (context, index) {

                    bool selected =
                        selectedTime == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFF1859E8)
                              : Colors.white,
                          borderRadius:
                              BorderRadius.circular(22),
                          border: Border.all(
                            color: selected
                                ? Colors.transparent
                                : const Color(0xFFE6E8EF),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            times[index],
                            style: TextStyle(
                              color: selected
                                  ? Colors.white
                                  : Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 35),

              // ==============================
              // BOOK NOW BUTTON
              // ==============================
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Appointment booked successfully!',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF1859E8),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Book now',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ==============================
              // BOTTOM NAVIGATION
              // ==============================
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFF101A2B),
                  borderRadius:
                      BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                  children: [

                    // HOME
                    navIcon(
                      Icons.home_outlined,
                      false,
                    ),

                    // SEARCH
                    navIcon(
                      Icons.search,
                      false,
                    ),

                    // APPOINTMENTS - SELECTED
                    navIcon(
                      Icons.calendar_month,
                      true,
                    ),

                    // PROFILE
                    navIcon(
                      Icons.person_outline,
                      false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // ==============================
  // BOTTOM NAV ICON
  // ==============================
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
            ? Colors.black
            : Colors.white,
        size: 23,
      ),
    );
  }
}