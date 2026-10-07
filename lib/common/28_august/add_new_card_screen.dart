import 'package:flutter/material.dart';


class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final Color orange = const Color(0xFFFF8A00);
  final Color darkOrange = const Color(0xFFE85B00);

  bool saveCard = false;

  final TextEditingController cardNumberController =
      TextEditingController(text: "1234 5678 9101 1213");

  final TextEditingController nameController =
      TextEditingController(text: "David Warner");

  final TextEditingController dateController =
      TextEditingController(text: "12/05/2027");

  final TextEditingController cvvController =
      TextEditingController(text: "450");

  final TextEditingController zipController =
      TextEditingController(text: "5060");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ---------------- TOP BAR ----------------
              Row(
                children: [
                  _backButton(context),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Add New Card",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.more_vert,
                    size: 21,
                    color: Colors.black54,
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // ---------------- CARD PREVIEW ----------------
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFBD6B),
                      Color(0xFFE77935),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: orange.withValues(alpha: .18),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "USD  ◉",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Premium",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    const Text(
                      "••••  ••••  ••••  9101 1213",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "David Warner",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),

                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE22E25),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(-7, 0),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFB300),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ---------------- CARD DOTS ----------------
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _dot(true),
                    _dot(false),
                    _dot(false),
                  ],
                ),
              ),

              const SizedBox(height: 27),

              // ---------------- CARD INFORMATION ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Card Information",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 17,
                    color: Colors.black45,
                  ),
                ],
              ),

              const SizedBox(height: 17),

              _label("Card Number"),
              _input(
                controller: cardNumberController,
                suffix: Icons.visibility_off_outlined,
              ),

              const SizedBox(height: 12),

              _label("Account Holder Name"),
              _input(
                controller: nameController,
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _label("Expire Date"),
                        _input(
                          controller: dateController,
                          suffix: Icons.calendar_month_outlined,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  SizedBox(
                    width: 95,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _label("CVV"),
                        _input(
                          controller: cvvController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _label("Zip Code"),
                        _input(
                          controller: zipController,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _label("Location"),
                        Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .65),
                            borderRadius:
                                BorderRadius.circular(9),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "New York",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              // ---------------- SAVE CARD CHECKBOX ----------------
              GestureDetector(
                onTap: () {
                  setState(() {
                    saveCard = !saveCard;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                        color: saveCard
                            ? orange
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: saveCard
                              ? orange
                              : Colors.black38,
                        ),
                      ),
                      child: saveCard
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 13,
                            )
                          : null,
                    ),

                    const SizedBox(width: 7),

                    const Text(
                      "Save Card Information",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ---------------- SAVE CARD BUTTON ----------------
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFFBD62),
                        orange,
                        darkOrange,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Save Card",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
    );
  }

  Widget _backButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .7),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_left,
          size: 21,
        ),
      ),
    );
  }

  Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: active ? 19 : 7,
      height: 6,
      decoration: BoxDecoration(
        color: active ? orange : Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    IconData? suffix,
  }) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .65),
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 13,
          ),
          border: InputBorder.none,
          suffixIcon: suffix == null
              ? null
              : Icon(
                  suffix,
                  size: 16,
                  color: Colors.black38,
                ),
        ),
      ),
    );
  }
}