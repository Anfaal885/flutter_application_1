import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> products = [
    {
      'name': 'Wireless Headphone',
      'price': '\$120.00',
      'images': [
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800',
        'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=800',
        'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=800',
        'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=800',
      ],
    },
    {
      'name': 'Women Sweater',
      'price': '\$120.00',
      'images': [
        'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=800',
        'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=800',
        'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=800',
      ],
    },
    {
      'name': 'Smart Watch',
      'price': '\$55.00',
      'images': [
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800',
        'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=800',
        'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?w=800',
      ],
    },
    {
      'name': 'Sneakers',
      'price': '\$90.00',
      'images': [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
        'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
        'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=800',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // TOP ICONS
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.grid_view_rounded,
                      size: 21,
                    ),
                    const Icon(
                      Icons.notifications_none_rounded,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),

            // SEARCH
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xfff6f6f6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 18,
                              color: Colors.grey,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.tune,
                      color: Colors.grey,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ),

            // SALE BANNER
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xffffe8d8),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 16,
                        top: 15,
                        child: Text(
                          'Super Sale\nDiscount',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 16,
                        top: 58,
                        child: Text(
                          'Up to 50%',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 13,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xfff36f16),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            'Shop Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.network(
                          products[3]['images'][0],
                          width: 145,
                          height: 115,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // CATEGORIES
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 14,
                  ),
                  children: const [
                    _Category(
                      icon: Icons.shopping_bag_outlined,
                      text: 'Shoes',
                    ),
                    _Category(
                      icon: Icons.face_outlined,
                      text: 'Beauty',
                    ),
                    _Category(
                      icon: Icons.checkroom_outlined,
                      text: "Women's\nFashion",
                    ),
                    _Category(
                      icon: Icons.diamond_outlined,
                      text: 'Jewelry',
                    ),
                    _Category(
                      icon: Icons.person_outline,
                      text: "Men's\nFashion",
                    ),
                  ],
                ),
              ),
            ),

            // SPECIAL FOR YOU
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Text(
                  'Special For You',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // PRODUCTS
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = products[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsScreen(
                                productName: product['name'] as String,
                                price: product['price'] as String,
                                images: List<String>.from(
                                  product['images'],
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff5f5f5),
                                    borderRadius:
                                        BorderRadius.circular(11),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(11),
                                    child: Image.network(
                                      product['images'][0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 7,
                                  top: 7,
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.favorite_border,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            product['price'],
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Row(
                            children: [
                              _Dot(color: Colors.black),
                              _Dot(color: Colors.blue),
                              _Dot(color: Colors.orange),
                              _Dot(color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: products.length,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 15,
                  childAspectRatio: .82,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 80),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.home_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 50),

                  // CART
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),

                  const Icon(
                    Icons.settings_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            // CENTER ORANGE BAG
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 27,
              top: -8,
              child: Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  color: Color(0xfff36f16),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Category({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xfff3f3f3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.grey,
              size: 21,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 8,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 7,
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}