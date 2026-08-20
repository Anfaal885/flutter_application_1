import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {

  final PageController pageController =
      PageController();

  int currentPage = 0;
  int selectedColor = 0;
  String selectedSize = '39';

  final List<Color> colors = [
    Colors.black,
    const Color(0xFFFFA000),
    const Color(0xFF2696E8),
    const Color(0xFFF03D3D),
  ];

  final List<String> sizes = [
    '39',
    '40',
    '41',
    '42',
    '43',
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      widget.image,
      'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=1000',
      'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=1000',
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- TOP BAR ----------------

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 27,
                    ),
                  ),

                  const Spacer(),

                  const Icon(
                    Icons.favorite_border,
                    size: 32,
                  ),

                  const SizedBox(width: 10),
                ],
              ),
            ),

            // ---------------- CONTENT ----------------

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  35,
                  5,
                  35,
                  25,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // ---------------- IMAGE SLIDER ----------------

                    SizedBox(
                      height: 420,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        itemBuilder:
                            (context, index) {
                          return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (
                                context,
                                child,
                                progress,
                              ) {
                                if (progress == null) {
                                  return child;
                                }

                                return const Center(
                                  child:
                                      CircularProgressIndicator(),
                                );
                              },
                              errorBuilder:
                                  (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return const Center(
                                  child: Icon(
                                    Icons
                                        .image_not_supported,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    // ---------------- 3 DOTS ----------------

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) {
                          final selected =
                              currentPage == index;

                          return AnimatedContainer(
                            duration:
                                const Duration(
                              milliseconds: 200,
                            ),
                            margin:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 4,
                            ),
                            height: 9,
                            width: selected
                                ? 30
                                : 9,
                            decoration:
                                BoxDecoration(
                              color: selected
                                  ? Colors.black
                                  : Colors.grey.shade400,
                              borderRadius:
                                  BorderRadius.circular(
                                10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ---------------- NAME + PRICE ----------------

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 27,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ---------------- RATING ----------------

                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color:
                              Color(0xFFEAA000),
                          size: 25,
                        ),

                        SizedBox(width: 5),

                        Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),

                        SizedBox(width: 7),

                        Text(
                          '(12 Reviews)',
                          style: TextStyle(
                            color:
                                Color(0xFF999999),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ---------------- DETAILS ----------------

                    const Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'This stylish and comfortable shoe '
                      'is perfect for everyday use. It provides '
                      'excellent comfort, quality and modern design.',

                      style: TextStyle(
                        color:
                            Color(0xFF999999),
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ---------------- COLOR ----------------

                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: List.generate(
                        colors.length,
                        (index) {
                          final selected =
                              selectedColor == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor =
                                    index;
                              });
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets
                                      .only(
                                right: 15,
                              ),
                              height: 48,
                              width: 48,
                              decoration:
                                  BoxDecoration(
                                color: colors[index],
                                shape:
                                    BoxShape.circle,
                                border: Border.all(
                                  color: selected
                                      ? const Color(
                                          0xFFFFA000,
                                        )
                                      : Colors
                                          .transparent,
                                  width: 4,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ---------------- SIZE ----------------

                    const Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 13),

                    SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal,
                      child: Row(
                        children:
                            sizes.map((size) {
                          final selected =
                              selectedSize == size;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize =
                                    size;
                              });
                            },
                            child: Container(
                              height: 62,
                              width: 88,
                              margin:
                                  const EdgeInsets
                                      .only(
                                right: 12,
                              ),
                              alignment:
                                  Alignment.center,
                              decoration:
                                  BoxDecoration(
                                borderRadius:
                                    BorderRadius
                                        .circular(12),
                                border: Border.all(
                                  color: selected
                                      ? const Color(
                                          0xFFFFA000,
                                        )
                                      : const Color(
                                          0xFFE0E0E0,
                                        ),
                                  width: selected
                                      ? 2
                                      : 1,
                                ),
                              ),
                              child: Text(
                                size,
                                style:
                                    const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ---------------- BUY NOW ----------------

                    SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${widget.name} - '
                                'Size $selectedSize',
                              ),
                            ),
                          );
                        },
                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(
                            0xFFFFA000,
                          ),
                          foregroundColor:
                              Colors.white,
                          elevation: 0,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              17,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}