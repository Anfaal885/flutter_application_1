import 'package:flutter/material.dart';
import 'cart_data.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final double price;
  final String image;
  final double rating;
  final int reviews;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    this.rating = 4.5,
    this.reviews = 12,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  int selectedColor = 0;
  String? selectedSize;
  int currentPage = 0;

  late PageController pageController;

  final List<Color> colors = [
    Colors.black,
    const Color(0xFFFFA000),
    const Color(0xFF2196F3),
    const Color(0xFFF44336),
  ];

  final List<String> sizes = [
    '39',
    '40',
    '41',
    '42',
    '43',
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void addProductToCart() {
    if (selectedSize == null) {
      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size first'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    }

    // Actual cart mein product add
    CartData.instance.addToCart(
      name: widget.name,
      price: widget.price,
      image: widget.image,
      size: selectedSize!,
    );

    // Purane messages remove
    ScaffoldMessenger.of(context).clearSnackBars();

    // Temporary message
    final messenger = ScaffoldMessenger.of(context);

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          '${widget.name} added to cart',
        ),

        duration: const Duration(seconds: 2),

        behavior: SnackBarBehavior.floating,

        action: SnackBarAction(
          label: 'VIEW CART',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> productImages = [
      widget.image,
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=900',
      'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=900',
      'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=900',
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  10,
                  20,
                  20,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    // ================= TOP BAR =================

                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,

                          decoration: BoxDecoration(
                            color:
                                const Color(0xFFF5F5F5),
                            borderRadius:
                                BorderRadius.circular(14),
                          ),

                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },

                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 19,
                            ),
                          ),
                        ),

                        const Spacer(),

                        Container(
                          width: 44,
                          height: 44,

                          decoration: BoxDecoration(
                            color:
                                const Color(0xFFF5F5F5),
                            borderRadius:
                                BorderRadius.circular(14),
                          ),

                          child: IconButton(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.favorite_border,
                              size: 23,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // ================= IMAGE SLIDER =================

                    Container(
                      width: double.infinity,
                      height: 360,

                      decoration: BoxDecoration(
                        color:
                            const Color(0xFFF3F3F3),
                        borderRadius:
                            BorderRadius.circular(25),
                      ),

                      clipBehavior:
                          Clip.antiAlias,

                      child: PageView.builder(
                        controller: pageController,
                        itemCount:
                            productImages.length,

                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },

                        itemBuilder:
                            (context, index) {
                          return Image.network(
                            productImages[index],
                            fit: BoxFit.cover,

                            errorBuilder:
                                (_, __, ___) {
                              return const Center(
                                child: Icon(
                                  Icons
                                      .image_not_supported_outlined,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ================= DOTS =================

                    Center(
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min,

                        children: List.generate(
                          productImages.length,
                          (index) {
                            final bool selected =
                                currentPage == index;

                            return GestureDetector(
                              onTap: () {
                                pageController
                                    .animateToPage(
                                  index,
                                  duration:
                                      const Duration(
                                    milliseconds: 300,
                                  ),
                                  curve:
                                      Curves.easeInOut,
                                );
                              },

                              child:
                                  AnimatedContainer(
                                duration:
                                    const Duration(
                                  milliseconds: 200,
                                ),

                                margin:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal: 4,
                                ),

                                width:
                                    selected ? 25 : 9,

                                height: 9,

                                decoration:
                                    BoxDecoration(
                                  color: selected
                                      ? Colors.black
                                      : Colors
                                          .grey.shade400,

                                  borderRadius:
                                      BorderRadius
                                          .circular(20),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // ================= NAME + PRICE =================

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: Text(
                            widget.name,

                            style:
                                const TextStyle(
                              fontSize: 25,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          '\$${widget.price.toStringAsFixed(0)}',

                          style:
                              const TextStyle(
                            fontSize: 23,
                            fontWeight:
                                FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ================= RATING =================

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color:
                              Color(0xFFFFA000),
                          size: 22,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          widget.rating.toString(),

                          style:
                              const TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.w700,
                          ),
                        ),

                        const SizedBox(width: 7),

                        Text(
                          '(${widget.reviews} Reviews)',

                          style:
                              const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // ================= DETAILS =================

                    const Text(
                      'Details',

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 9),

                    const Text(
                      'This stylish and comfortable shoe is perfect for everyday use. It provides excellent comfort, quality and modern design.',

                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ================= COLOR =================

                    const Text(
                      'Color',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children:
                          List.generate(
                        colors.length,
                        (index) {
                          final bool selected =
                              selectedColor ==
                                  index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor =
                                    index;
                              });
                            },

                            child: Container(
                              width: 45,
                              height: 45,

                              margin:
                                  const EdgeInsets
                                      .only(
                                right: 14,
                              ),

                              padding:
                                  const EdgeInsets
                                      .all(4),

                              decoration:
                                  BoxDecoration(
                                shape:
                                    BoxShape.circle,

                                border: Border.all(
                                  color: selected
                                      ? const Color(
                                          0xFFFFA000)
                                      : Colors
                                          .transparent,

                                  width: 3,
                                ),
                              ),

                              child: Container(
                                decoration:
                                    BoxDecoration(
                                  color:
                                      colors[index],
                                  shape:
                                      BoxShape.circle,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ================= SIZE =================

                    const Text(
                      'Size',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 55,

                      child: ListView.builder(
                        scrollDirection:
                            Axis.horizontal,

                        itemCount:
                            sizes.length,

                        itemBuilder:
                            (context, index) {
                          final bool selected =
                              selectedSize ==
                                  sizes[index];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize =
                                    sizes[index];
                              });
                            },

                            child: Container(
                              width: 65,

                              margin:
                                  const EdgeInsets
                                      .only(
                                right: 10,
                              ),

                              alignment:
                                  Alignment.center,

                              decoration:
                                  BoxDecoration(
                                color: selected
                                    ? Colors.black
                                    : Colors.white,

                                border: Border.all(
                                  color: selected
                                      ? Colors.black
                                      : Colors
                                          .grey
                                          .shade300,
                                ),

                                borderRadius:
                                    BorderRadius
                                        .circular(12),
                              ),

                              child: Text(
                                sizes[index],

                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : Colors.black,

                                  fontWeight:
                                      FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),

            // ================= BUY NOW =================

            Padding(
              padding:
                  const EdgeInsets.fromLTRB(
                20,
                8,
                20,
                18,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  onPressed: addProductToCart,

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFFFA000),

                    foregroundColor:
                        Colors.white,

                    elevation: 0,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                  ),

                  child: const Text(
                    'Buy Now',

                    style: TextStyle(
                      fontSize: 17,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}