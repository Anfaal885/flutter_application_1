import 'package:flutter/material.dart';
import 'product_card.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  int selectedBottom = 0;

  final List<String> categories = [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Jordan',
  ];

  final List<Map<String, String>> products = [
    {
      'name': 'Nike Air Max',
      'price': '\$120',
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
    },
    {
      'name': 'Nike Air Force',
      'price': '\$100',
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=800',
    },
    {
      'name': 'Nike Running',
      'price': '\$110',
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=800',
    },
    {
      'name': 'Nike Casual',
      'price': '\$95',
      'brand': 'Nike',
      'image':
          'https://images.unsplash.com/photo-1495555961986-6d4c1ecb7be3?w=800',
    },
  ];

  List<Map<String, String>> get filteredProducts {
    if (selectedCategory == 0) {
      return products;
    }

    final brand = categories[selectedCategory];

    return products
        .where((product) => product['brand'] == brand)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- HEADER ----------------

            Padding(
              padding: const EdgeInsets.fromLTRB(
                35,
                20,
                35,
                0,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Dhina',
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'Good Morning!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 54,
                    width: 54,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEAEAEA),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // ---------------- SEARCH ----------------

            Padding(
              padding: const EdgeInsets.fromLTRB(
                35,
                22,
                35,
                0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius:
                            BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 18),

                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey,
                          ),

                          SizedBox(width: 14),

                          Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Container(
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),

            // ---------------- CATEGORIES ----------------

            SizedBox(
              height: 82,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(
                  35,
                  17,
                  35,
                  10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected =
                      selectedCategory == index;

                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.black
                              : Colors.white,
                          borderRadius:
                              BorderRadius.circular(30),
                          border: Border.all(
                            color: isSelected
                                ? Colors.black
                                : const Color(0xFFE0E0E0),
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF999999),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // ---------------- PRODUCT GRID ----------------

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(
                  35,
                  5,
                  35,
                  20,
                ),
                itemCount: filteredProducts.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final product =
                      filteredProducts[index];

                  return ProductCard(
                    name: product['name']!,
                    price: product['price']!,
                    image: product['image']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(
                            name: product['name']!,
                            price: product['price']!,
                            image: product['image']!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAVIGATION ----------------

      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: selectedBottom,

        onTap: (index) {
          setState(() {
            selectedBottom = index;
          });
        },

        type:
            BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        selectedItemColor:
            const Color(0xFFE4A522),

        unselectedItemColor:
            const Color(0xFFB8B8B8),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon:
                Icon(Icons.shopping_bag_outlined),
            activeIcon:
                Icon(Icons.shopping_bag),
            label: 'Shop',
          ),

          BottomNavigationBarItem(
            icon:
                Icon(Icons.shopping_cart_outlined),
            activeIcon:
                Icon(Icons.shopping_cart),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon:
                Icon(Icons.person_outline),
            activeIcon:
                Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}