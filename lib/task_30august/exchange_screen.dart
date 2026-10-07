import 'package:flutter/material.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {

  String amount = '37';

  void pressNumber(String number) {
    setState(() {

      if (number == '.') {

        if (!amount.contains('.')) {
          amount += '.';
        }

        return;
      }

      if (amount == '0') {
        amount = number;
      } else {
        amount += number;
      }
    });
  }

  void deleteNumber() {
    setState(() {

      if (amount.length > 1) {
        amount = amount.substring(
          0,
          amount.length - 1,
        );
      } else {
        amount = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    double usd = double.tryParse(amount) ?? 0;

    double bdt = usd * 122.82;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 18),

                // ================= HEADER =================

                Row(
                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                      ),

                      padding: EdgeInsets.zero,

                      constraints:
                          const BoxConstraints(),
                    ),

                    const Expanded(
                      child: Center(
                        child: Text(
                          'Exchange',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // ================= USD =================

                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          const Text(
                            '1068 USD',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            amount,
                            style: const TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius:
                            BorderRadius.circular(8),
                      ),

                      child: Row(
                        children: [

                          const Text(
                            '🇺🇸',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),

                          const SizedBox(width: 6),

                          const Text(
                            'USD',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(width: 3),

                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 17,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 17),

                // ================= SWAP =================

                Center(
                  child: Container(
                    width: 47,
                    height: 47,

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFE84D13),
                          Color(0xFFE99B21),
                        ],
                      ),

                      borderRadius:
                          BorderRadius.circular(11),
                    ),

                    child: const Icon(
                      Icons.swap_vert,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),

                const SizedBox(height: 17),

                // ================= BDT =================

                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          const Text(
                            '131,171.76 BDT',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            bdt.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius:
                            BorderRadius.circular(8),
                      ),

                      child: Row(
                        children: [

                          const Text(
                            '🇧🇩',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),

                          const SizedBox(width: 6),

                          const Text(
                            'BDT',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(width: 3),

                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 17,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // ================= DETAILS =================

                Row(
                  children: [

                    const Text(
                      'Exchange fee',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                    const Spacer(),

                    const Text(
                      '1.18 USD',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  children: [

                    const Text(
                      'Rate',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                    const Spacer(),

                    const Text(
                      '1 USD ≈ 122.82 BDT',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 13),

                Row(
                  children: [

                    const Text(
                      'Apr 15, 10:39 PM UTC',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [

                        const Icon(
                          Icons.trending_up,
                          size: 15,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 4),

                        Text(
                          '3.5% (1Y)',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                // ================= EXCHANGE BUTTON =================

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      elevation: 0,

                      backgroundColor:
                          const Color(0xFFE86416),

                      foregroundColor: Colors.white,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      'Exchange Money',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ================= NUMBER PAD =================

                GridView.count(
                  crossAxisCount: 3,

                  shrinkWrap: true,

                  physics:
                      const NeverScrollableScrollPhysics(),

                  mainAxisSpacing: 8,

                  crossAxisSpacing: 20,

                  childAspectRatio: 2.2,

                  children: [

                    numberButton('1'),
                    numberButton('2'),
                    numberButton('3'),

                    numberButton('4'),
                    numberButton('5'),
                    numberButton('6'),

                    numberButton('7'),
                    numberButton('8'),
                    numberButton('9'),

                    numberButton('.'),
                    numberButton('0'),
                    deleteButton(),
                  ],
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // NUMBER BUTTON
  // ============================================================

  Widget numberButton(String number) {

    return GestureDetector(
      onTap: () {
        pressNumber(number);
      },

      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DELETE BUTTON
  // ============================================================

  Widget deleteButton() {

    return GestureDetector(
      onTap: deleteNumber,

      child: const Center(
        child: Icon(
          Icons.backspace_outlined,
          size: 18,
        ),
      ),
    );
  }
}