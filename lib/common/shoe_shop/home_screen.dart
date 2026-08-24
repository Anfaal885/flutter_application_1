import 'package:flutter/material.dart';
import 'product_card.dart';
import 'product_details_screen.dart';
import 'cart_screen.dart';
import 'shop_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBrand = 0;

  final List<String> brands = [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Jordan',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Nike Air Max',
      'price': 120.0,
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=700',
      'rating': 4.5,
      'reviews': 12,
    },
    {
      'name': 'Nike Air Force',
      'price': 100.0,
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=700',
      'rating': 4.5,
      'reviews': 15,
    },
    {
      'name': 'Nike Running',
      'price': 110.0,
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=700',
      'rating': 4.4,
      'reviews': 10,
    },
    {
      'name': 'Nike Casual',
      'price': 95.0,
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=700',
      'rating': 4.3,
      'reviews': 9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedBrand == 0
        ? products
        : products
            .where(
              (product) =>
                  product['brand'] == brands[selectedBrand],
            )
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ================= MAIN CONTENT =================

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  16,
                  20,
                  20,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    // ================= HEADER =================

                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Hi Sara',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Good Morning!',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight:
                                    FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        const CircleAvatar(
                          radius: 23,
                          
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ================= SEARCH =================

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 55,

                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFFF4F4F4),

                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),

                            child: const TextField(
                              decoration:
                                  InputDecoration(
                                hintText: 'Search',

                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 28,
                                ),

                                border:
                                    InputBorder.none,

                                contentPadding:
                                    EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Container(
                          height: 55,
                          width: 55,

                          decoration:
                              BoxDecoration(
                            color: Colors.black,

                            borderRadius:
                                BorderRadius.circular(
                              16,
                            ),
                          ),

                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // ================= BRANDS =================

                    SizedBox(
                      height: 48,

                      child: ListView.builder(
                        scrollDirection:
                            Axis.horizontal,

                        itemCount: brands.length,

                        itemBuilder:
                            (context, index) {
                          final bool isSelected =
                              selectedBrand == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBrand = index;
                              });
                            },

                            child:
                                AnimatedContainer(
                              duration:
                                  const Duration(
                                milliseconds: 200,
                              ),

                              margin:
                                  const EdgeInsets.only(
                                right: 10,
                              ),

                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 24,
                              ),

                              alignment:
                                  Alignment.center,

                              decoration:
                                  BoxDecoration(
                                color: isSelected
                                    ? Colors.black
                                    : Colors.white,

                                borderRadius:
                                    BorderRadius.circular(
                                  25,
                                ),

                                border: Border.all(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.grey
                                          .shade300,
                                ),
                              ),

                              child: Text(
                                brands[index],

                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey,

                                  fontWeight:
                                      FontWeight.w600,

                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 22),

                    // ================= SECTION TITLE =================

                    Row(
                      children: [
                        const Text(
                          'Popular Shoes',

                          style: TextStyle(
                            fontSize: 21,
                            fontWeight:
                                FontWeight.w800,
                          ),
                        ),

                        const Spacer(),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const ShopScreen(),
                              ),
                            );
                          },

                          child: const Text(
                            'See All',

                            style: TextStyle(
                              color:
                                  Color(0xFFE5A51A),

                              fontWeight:
                                  FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // ================= PRODUCTS =================

                    GridView.builder(
                      shrinkWrap: true,

                      physics:
                          const NeverScrollableScrollPhysics(),

                      itemCount:
                          filteredProducts.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        crossAxisSpacing: 14,

                        mainAxisSpacing: 18,

                        childAspectRatio: .66,
                      ),

                      itemBuilder:
                          (context, index) {
                        final product =
                            filteredProducts[index];

                        return ProductCard(
                          name: product['name'],
                          price: product['price'],
                          image: product['image'],

                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetailScreen(
                                  name:
                                      product['name'],

                                  price:
                                      product['price'],

                                  image:
                                      product['image'],

                                  rating:
                                      product['rating'],

                                  reviews:
                                      product['reviews'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ================= BOTTOM NAVIGATION =================

            Container(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),

              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.grey.withOpacity(.12),

                    blurRadius: 12,

                    offset:
                        const Offset(0, -3),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,

                children: [
                  // HOME
                  _navItem(
                    Icons.home_rounded,
                    'Home',
                    true,

                    () {},
                  ),

                  // SHOP
                  _navItem(
                    Icons.shopping_bag_outlined,
                    'Shop',
                    false,

                    () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              const ShopScreen(),
                        ),
                      );
                    },
                  ),

                  // CART
                  _navItem(
                    Icons.shopping_cart_outlined,
                    'Cart',
                    false,

                    () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              const CartScreen(),
                        ),
                      );
                    },
                  ),

                  // PROFILE
                  _navItem(
                    Icons.person_outline,
                    'Profile',
                    false,

                    () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= NAVIGATION ITEM =================

  Widget _navItem(
    IconData icon,
    String label,
    bool selected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(15),

      child: Padding(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),

        child: Column(
          mainAxisSize:
              MainAxisSize.min,

          children: [
            Icon(
              icon,

              color: selected
                  ? const Color(0xFFE5A51A)
                  : Colors.grey,

              size: 27,
            ),

            const SizedBox(height: 3),

            Text(
              label,

              style: TextStyle(
                color: selected
                    ? const Color(0xFFE5A51A)
                    : Colors.grey,

                fontSize: 11,

                fontWeight: selected
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}