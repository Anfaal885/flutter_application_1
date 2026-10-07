import 'package:flutter/material.dart';
import 'exchange_screen.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // ================= HEADER =================

                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                    ),

                    const Expanded(
                      child: Center(
                        child: Text(
                          'Analytics',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.search,
                      size: 24,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // ================= TOP TABS =================

                SizedBox(
                  height: 48,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      // Analytics selected
                      Container(
                        width: 104,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFE84D12),
                              Color(0xFFE59A20),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 22),

                      // Transfer
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ExchangeScreen(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          width: 78,
                          child: Center(
                            child: Text(
                              'Transfer',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 18),

                      // Income
                      const SizedBox(
                        width: 65,
                        child: Center(
                          child: Text(
                            'Income',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 18),

                      // Expense
                      const SizedBox(
                        width: 70,
                        child: Center(
                          child: Text(
                            'Expense',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 38),

                // ================= SPENDING SUMMARY =================

                const Text(
                  'Spending Summary',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ================= DONUT =================

                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(150, 150),
                            painter: DonutPainter(),
                          ),

                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '\$1845',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Spending',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 15),

                    // ================= LEGEND =================

                    Expanded(
                      child: Column(
                        children: const [
                          CategoryRow(
                            title: 'Food & Dining',
                            percentage: '53%',
                            color: Color(0xFFD89B2B),
                          ),

                          SizedBox(height: 14),

                          CategoryRow(
                            title: 'Education',
                            percentage: '25%',
                            color: Color(0xFFBDBDBD),
                          ),

                          SizedBox(height: 14),

                          CategoryRow(
                            title: 'Subscriptions',
                            percentage: '14%',
                            color: Color(0xFFC95428),
                          ),

                          SizedBox(height: 14),

                          CategoryRow(
                            title: 'Shopping',
                            percentage: '8%',
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // ================= UPCOMING BILLS =================

                Row(
                  children: [
                    const Text(
                      'Upcoming Bills',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // ================= BILL 1 =================

                const BillRow(
                  icon: Icons.wifi,
                  title: 'Internet - FiberLink',
                  date: 'Due 15 Apr',
                  days: '2days',
                  amount: '179.99',
                ),

                const SizedBox(height: 21),

                // ================= BILL 2 =================

                const BillRow(
                  icon: Icons.bolt_outlined,
                  title: 'Electricity',
                  date: 'Due 18 Apr',
                  days: '3days',
                  amount: '297.50',
                ),

                const SizedBox(height: 21),

                // ================= BILL 3 =================

                const BillRow(
                  icon: Icons.water_drop_outlined,
                  title: 'Water - AquaPure',
                  date: 'Due 24 Apr',
                  days: '7days',
                  amount: '120.99',
                ),

                const SizedBox(height: 21),

                // ================= BILL 4 =================

                const BillRow(
                  icon: Icons.phone_outlined,
                  title: 'Phone - Connect',
                  date: 'Due 27 Apr',
                  days: '13days',
                  amount: '172.99',
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CATEGORY ROW
// ============================================================

class CategoryRow extends StatelessWidget {
  final String title;
  final String percentage;
  final Color color;

  const CategoryRow({
    super.key,
    required this.title,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
        ),

        Text(
          percentage,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// BILL ROW
// ============================================================

class BillRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String days;
  final String amount;

  const BillRow({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.days,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        SizedBox(
          width: 35,
          child: Icon(
            icon,
            size: 21,
            color: Colors.black87,
          ),
        ),

        const SizedBox(width: 10),

        // Name + date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 10,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Days + amount
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              days,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              amount,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================================
// DONUT CHART
// ============================================================

class DonutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = 51.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.butt;

    const total = 360.0;

    // Food & Dining - 53%
    paint.color = const Color(0xFFD89B2B);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -1.5708,
      total * 0.53 * 3.14159 / 180,
      false,
      paint,
    );

    // Education - 25%
    paint.color = const Color(0xFFBDBDBD);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -1.5708 + total * 0.53 * 3.14159 / 180,
      total * 0.25 * 3.14159 / 180,
      false,
      paint,
    );

    // Subscriptions - 14%
    paint.color = const Color(0xFFC95428);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -1.5708 +
          total * (0.53 + 0.25) * 3.14159 / 180,
      total * 0.14 * 3.14159 / 180,
      false,
      paint,
    );

    // Shopping - 8%
    paint.color = Colors.black;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -1.5708 +
          total * (0.53 + 0.25 + 0.14) * 3.14159 / 180,
      total * 0.08 * 3.14159 / 180,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}