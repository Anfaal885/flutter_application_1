import 'package:flutter/material.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  int quantity = 1;
  int selectedColor = 0;

  final List<Color> colors = [
    const Color(0xff18245b),
    const Color(0xffa52f2f),
    const Color(0xffe1a177),
    const Color(0xffd69b9b),
    const Color(0xff49a05b),
  ];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xfff6f3eb),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TOP BAR
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 17,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 21,
                            ),
                          ),
                          const Icon(
                            Icons.bookmark_border,
                            size: 22,
                          ),
                        ],
                      ),
                    ),

                    // MAIN PRODUCT IMAGE
                    Container(
                      height: 300,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffeeeae1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        product['image'],
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // HORIZONTAL IMAGE SCROLL
                    SizedBox(
                      height: 58,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 58,
                            height: 58,
                            margin: const EdgeInsets.only(
                              right: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffe4e1d9),
                              borderRadius:
                                  BorderRadius.circular(6),
                              border: index == 0
                                  ? Border.all(
                                      color: const Color(0xff555555),
                                      width: 1.5,
                                    )
                                  : null,
                            ),
                            child: Image.network(
                              product['image'],
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // PRODUCT INFORMATION
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontFamily: 'serif',
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            '₹${product['price']}',
                            style: const TextStyle(
                              color: Color(0xff174fd5),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // COLOR + QUANTITY
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Color:',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Row(
                                children: [
                                  const Text(
                                    'Quantity:',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  GestureDetector(
                                    onTap: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    },
                                    child: const Text(
                                      '−',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    child: const Text(
                                      '+',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 7),

                          // COLORS
                          Row(
                            children: List.generate(
                              colors.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = index;
                                    });
                                  },
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    margin:
                                        const EdgeInsets.only(
                                      right: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      shape: BoxShape.circle,
                                      border:
                                          selectedColor == index
                                              ? Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                )
                                              : null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            product['description'],
                            style: const TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ADD TO CART BUTTON
            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                5,
                24,
                18,
              ),
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CartScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 19,
                  ),
                  label: const Text(
                    'ADD TO CART',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff174fd5),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
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