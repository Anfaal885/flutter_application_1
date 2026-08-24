import 'package:flutter/material.dart';
import 'cart_screen.dart';

class PlantHomeScreen extends StatelessWidget {

  const PlantHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final List<List<dynamic>> categories = [

      [
        'PLANTS',
        Icons.eco,
        const Color(0xFFFFF7E8),
      ],

      [
        'POTTERIES',
        Icons.local_florist,
        const Color(0xFFEFFBEF),
      ],

      [
        'NURSERY',
        Icons.grass,
        const Color(0xFFFFF8E9),
      ],

      [
        'GARDENING',
        Icons.yard,
        const Color(0xFFEAF5FF),
      ],

      [
        'LIVESTOCK',
        Icons.pets,
        const Color(0xFFFFEAF4),
      ],

      [
        'TECHNOLOGY',
        Icons.precision_manufacturing,
        const Color(0xFFF0E9FF),
      ],

      [
        'MACHINERY',
        Icons.agriculture,
        const Color(0xFFFFF4E5),
      ],

      [
        'CHEMICAL',
        Icons.science,
        const Color(0xFFEAF8FF),
      ],

      [
        'SERVICES',
        Icons.build,
        const Color(0xFFFFF0E8),
      ],
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.fromLTRB(
            20,
            12,
            20,
            25,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // ---------------- HEADER ----------------

              Row(
                children: [

                  const Icon(
                    Icons.home_rounded,

                    color:
                        Color(0xFF18B72D),

                    size: 29,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  const Text(
                    'Home',

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),

                  const Icon(
                    Icons
                        .keyboard_arrow_down_rounded,

                    size: 28,
                  ),

                  const Spacer(),

                  // CART BUTTON

                  InkWell(
                    borderRadius:
                        BorderRadius.circular(30),

                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              const CartScreen(),
                        ),
                      );
                    },

                    child: Container(
                      width: 52,
                      height: 52,

                      decoration:
                          const BoxDecoration(
                        color:
                            Color(0xFF13B82A),

                        shape:
                            BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons
                            .shopping_bag_outlined,

                        color:
                            Colors.white,

                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 4,
              ),

              const Text(
                'M-2, Mianwali Point, Islamabad',

                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // ---------------- BANNER ----------------

              Container(
                height: 155,
                width: double.infinity,

                decoration:
                    BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(18),

                  color:
                      const Color(0xFFE9F4D8),
                ),

                clipBehavior:
                    Clip.antiAlias,

                child: Stack(
                  children: [

                    Positioned.fill(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?w=1000',

                        fit: BoxFit.cover,

                        opacity:
                            const AlwaysStoppedAnimation(
                          .28,
                        ),
                      ),
                    ),

                    const Padding(
                      padding:
                          EdgeInsets.only(
                        left: 24,
                        top: 25,
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Text(
                            'GROW MORE',

                            style:
                                TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.w700,
                            ),
                          ),

                          Text(
                            'MEGA SALE',

                            style:
                                TextStyle(
                              fontSize: 34,
                              fontWeight:
                                  FontWeight.w900,

                              height: 1,
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          Text(
                            'UP TO 50% OFF',

                            style:
                                TextStyle(
                              fontWeight:
                                  FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 26,
              ),

              // ---------------- CATEGORY TITLE ----------------

              const Text(
                'What are you looking for?',

                style: TextStyle(
                  fontSize: 21,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),

              const SizedBox(
                height: 14,
              ),

              // ---------------- CATEGORIES ----------------

              GridView.builder(
                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount:
                    categories.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,

                  crossAxisSpacing: 10,

                  mainAxisSpacing: 10,

                  childAspectRatio: .92,
                ),

                itemBuilder:
                    (context, index) {

                  final item =
                      categories[index];

                  return Container(
                    decoration:
                        BoxDecoration(
                      color:
                          item[2] as Color,

                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        Icon(
                          item[1] as IconData,

                          size: 48,

                          color:
                              const Color(
                            0xFF31B53B,
                          ),
                        ),

                        const SizedBox(
                          height: 9,
                        ),

                        Text(
                          item[0] as String,

                          textAlign:
                              TextAlign.center,

                          style:
                              const TextStyle(
                            fontSize: 11,
                            fontWeight:
                                FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 26,
              ),

              const Text(
                'Store Near me',

                style: TextStyle(
                  fontSize: 21,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}