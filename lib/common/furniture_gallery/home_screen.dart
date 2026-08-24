import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBottom = 0;

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Wingback Chair',
      'price': '1,512',
      'image':
          'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=800',
      'description':
          'A beautiful modern chair with a comfortable design. Perfect for adding style and comfort to your living space.',
    },
    {
      'name': 'Nashville Armchair',
      'price': '1,895',
      'image':
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800',
      'description':
          'A contemporary twist on classic mid-century modern design, the Nashville armchair is rooted in refined style and brings an air of sophistication to your living space.',
    },
  ];

  void openProduct(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f3eb),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),

                      // TOP BAR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 22,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.search,
                                size: 24,
                              ),
                              const SizedBox(width: 18),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffc9b7a4),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // NEW ARRIVALS
                      Container(
                        height: 145,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffeeeae1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 18,
                                top: 20,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DISCOVER',
                                    style: TextStyle(
                                      fontSize: 7,
                                      color: Colors.grey,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'New\nArrivals',
                                    style: TextStyle(
                                      fontFamily: 'serif',
                                      fontSize: 25,
                                      height: .9,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'SHOP NOW',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -5,
                              top: 5,
                              bottom: 5,
                              child: SizedBox(
                                width: 170,
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 34),

                      const Text(
                        'BEST SELLING',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),

                      const SizedBox(height: 18),

                      // PRODUCT CARDS
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _productCard(products[0]),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: _productCard(products[1]),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      const Text(
                        'TRENDING',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),

                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),

            // BOTTOM NAVIGATION
            Container(
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 35),
              color: const Color(0xfff6f3eb),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBottom = 0;
                      });
                    },
                    child: Icon(
                      Icons.home_outlined,
                      size: 25,
                      color: selectedBottom == 0
                          ? const Color(0xff174fd5)
                          : Colors.grey,
                    ),
                  ),

                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xff174fd5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CartScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 24,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () => openProduct(product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 145,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffeeeae1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.network(
              product['image'],
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            product['name'],
            style: const TextStyle(
              fontFamily: 'serif',
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Modern furniture',
            style: TextStyle(
              fontSize: 8,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹${product['price']}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xff174fd5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}