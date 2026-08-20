import 'package:flutter/material.dart';
import 'product_card.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Nike Air Max',
      'price': '\$120',
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
    },
    {
      'name': 'Nike Air Force',
      'price': '\$100',
      'image':
          'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
    },
    {
      'name': 'Nike Running',
      'price': '\$110',
      'image':
          'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=800',
    },
    {
      'name': 'Nike Casual',
      'price': '\$95',
      'image':
          'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=800',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // ================= HEADER =================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                10,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: const [

                      Text(
                        'Hi Dhina',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'Good Morning!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const CircleAvatar(
                    radius: 21,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=47',
                    ),
                  ),
                ],
              ),
            ),

            // ================= SEARCH BAR =================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 48,
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [

                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),

                          SizedBox(width: 10),

                          Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // ================= CATEGORIES =================

            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                children: [

                  categoryButton(
                    'All',
                    true,
                  ),

                  categoryButton(
                    'Nike',
                    false,
                  ),

                  categoryButton(
                    'Adidas',
                    false,
                  ),

                  categoryButton(
                    'Puma',
                    false,
                  ),

                  categoryButton(
                    'Jordan',
                    false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            // ================= PRODUCT GRID =================

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {

                  final product = products[index];

                  return ProductCard(
                    name: product['name']!,
                    price: product['price']!,
                    image: product['image']!,

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(
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

      // ================= BOTTOM NAVIGATION =================

      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.orange,

        unselectedItemColor: Colors.grey,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: 'Shop',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ================= CATEGORY BUTTON =================

  Widget categoryButton(
    String title,
    bool selected,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(right: 10),

      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: selected
            ? Colors.black
            : Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          color: selected
              ? Colors.white
              : Colors.grey,

          fontWeight:
              selected
                  ? FontWeight.bold
                  : FontWeight.normal,
        ),
      ),
    );
  }
}