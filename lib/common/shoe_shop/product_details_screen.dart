import 'package:flutter/material.dart';

class ProductDetailsScreen
    extends StatefulWidget {

  final String name;
  final String price;
  final String image;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetailsScreen>
      createState() =>
          _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {

  // Selected Color
  int selectedColor = 0;

  // Selected Size
  String selectedSize = '';

  // Available Colors
  final List<Color> colors = [
    Colors.black,
    Colors.orange,
    Colors.blue,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [

            // ================= TOP BAR =================

            Padding(
              padding:
                  const EdgeInsets.all(15),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  // Back Button

                  IconButton(
                    onPressed: () {

                      Navigator.pop(
                        context,
                      );
                    },

                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),

                  // Favorite Button

                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
                ],
              ),
            ),

            // ================= PRODUCT IMAGE =================

            Container(
              height: 280,

              margin:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              decoration: BoxDecoration(
                color:
                    const Color(0xffF5F5F5),

                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20),

                child: Image.network(
                  widget.image,

                  width: double.infinity,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {

                    return const Center(
                      child: Icon(
                        Icons
                            .shopping_bag_outlined,
                        size: 100,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ================= IMAGE DOTS =================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [
                dot(true),
                dot(false),
                dot(false),
              ],
            ),

            const SizedBox(height: 15),

            // ================= PRODUCT INFORMATION =================

            Expanded(
              child: SingleChildScrollView(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // Name & Price

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [

                        Expanded(
                          child: Text(
                            widget.name,

                            style:
                                const TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        Text(
                          widget.price,

                          style:
                              const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // ================= RATING =================

                    const Row(
                      children: [

                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 20,
                        ),

                        SizedBox(width: 5),

                        Text(
                          '4.5',

                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        SizedBox(width: 5),

                        Text(
                          '(12 Reviews)',

                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ================= DETAILS =================

                    const Text(
                      'Details',

                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'This stylish and comfortable '
                      'shoe is perfect for everyday use. '
                      'It provides excellent comfort, '
                      'quality and modern design.',

                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ================= COLOR =================

                    const Text(
                      'Color',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children:
                          List.generate(
                        colors.length,
                        (index) {

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
                                right: 12,
                              ),

                              height: 32,
                              width: 32,

                              decoration:
                                  BoxDecoration(

                                color:
                                    colors[index],

                                shape:
                                    BoxShape.circle,

                                border:
                                    Border.all(

                                  color:
                                      selectedColor ==
                                              index
                                          ? Colors
                                              .orange
                                          : Colors
                                              .transparent,

                                  width: 3,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ================= SIZE =================

                    const Text(
                      'Size',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,

                      children: [

                        sizeButton('39'),
                        sizeButton('40'),
                        sizeButton('41'),
                        sizeButton('42'),
                        sizeButton('43'),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // ================= BUY NOW =================

                    SizedBox(
                      width:
                          double.infinity,

                      height: 52,

                      child:
                          ElevatedButton(

                        onPressed: () {

                          if (selectedSize
                              .isEmpty) {

                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please select a size',
                                ),
                              ),
                            );

                            return;
                          }

                          ScaffoldMessenger
                              .of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                'Added to cart - Size $selectedSize',
                              ),
                            ),
                          );
                        },

                        style:
                            ElevatedButton
                                .styleFrom(

                          backgroundColor:
                              Colors.orange,

                          foregroundColor:
                              Colors.white,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(12),
                          ),
                        ),

                        child: const Text(
                          'Buy Now',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= DOT =================

  Widget dot(bool active) {

    return Container(

      margin:
          const EdgeInsets.symmetric(
        horizontal: 3,
      ),

      height: 7,

      width: active ? 20 : 7,

      decoration: BoxDecoration(

        color: active
            ? Colors.black
            : Colors.grey,

        borderRadius:
            BorderRadius.circular(10),
      ),
    );
  }

  // ================= SIZE BUTTON =================

  Widget sizeButton(
      String size) {

    bool selected =
        selectedSize == size;

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedSize = size;
        });
      },

      child: Container(

        padding:
            const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 11,
        ),

        decoration: BoxDecoration(

          color: selected
              ? Colors.black
              : Colors.white,

          borderRadius:
              BorderRadius.circular(8),

          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),

        child: Text(

          size,

          style: TextStyle(

            color: selected
                ? Colors.white
                : Colors.black,

            fontWeight:
                FontWeight.w500,
          ),
        ),
      ),
    );
  }
}