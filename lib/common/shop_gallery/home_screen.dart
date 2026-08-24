import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
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
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      'rating': 4.5,
      'reviews': 12,
    },
    {
      'name': 'Nike Air Force',
      'price': 100.0,
      'image':
          'https://images.unsplash.com/photo-1607522370275-f14206abe5d3?w=800',
      'rating': 4.5,
      'reviews': 15,
    },
    {
      'name': 'Nike Running',
      'price': 110.0,
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      'rating': 4.4,
      'reviews': 10,
    },
    {
      'name': 'Nike Casual',
      'price': 95.0,
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=800',
      'rating': 4.5,
      'reviews': 18,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            // ================= MAIN CONTENT =================

            Expanded(
              child: CustomScrollView(
                slivers: [

                  // ================= HEADER =================

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        0,
                      ),
                      child: Row(
                        children: [

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: const [

                                Text(
                                  'Hi Dhina',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),

                                SizedBox(height: 5),

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

                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ================= SEARCH =================

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Row(
                        children: [

                          Expanded(
                            child: Container(
                              height: 55,

                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius:
                                    BorderRadius.circular(16),
                              ),

                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 28,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Container(
                            height: 55,
                            width: 55,

                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.circular(16),
                            ),

                            child: const Icon(
                              Icons.tune,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ================= CATEGORIES =================

                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),

                        itemCount: categories.length,

                        itemBuilder: (context, index) {

                          final selected =
                              selectedCategory == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = index;
                              });
                            },

                            child: Container(
                              margin:
                                  const EdgeInsets.only(
                                right: 12,
                              ),

                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),

                              alignment: Alignment.center,

                              decoration: BoxDecoration(
                                color: selected
                                    ? Colors.black
                                    : Colors.white,

                                borderRadius:
                                    BorderRadius.circular(25),

                                border: Border.all(
                                  color: selected
                                      ? Colors.black
                                      : Colors.grey.shade300,
                                ),
                              ),

                              child: Text(
                                categories[index],

                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : Colors.grey,

                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),

                  // ================= PRODUCTS =================

                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    sliver: SliverGrid(
                      delegate:
                          SliverChildBuilderDelegate(
                        (context, index) {

                          final product =
                              products[index];

                          return GestureDetector(
                            onTap: () {

                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetailsScreen(
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

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Expanded(
                                  child: Container(
                                    width:
                                        double.infinity,

                                    decoration:
                                        BoxDecoration(
                                      color:
                                          const Color(
                                        0xFFF3F3F3,
                                      ),

                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                        20,
                                      ),
                                    ),

                                    clipBehavior:
                                        Clip.antiAlias,

                                    child: Stack(
                                      children: [

                                        Positioned.fill(
                                          child:
                                              Image.network(
                                            product['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        Positioned(
                                          top: 10,
                                          right: 10,

                                          child:
                                              Container(
                                            width: 34,
                                            height: 34,

                                            decoration:
                                                const BoxDecoration(
                                              color:
                                                  Colors.white,
                                              shape:
                                                  BoxShape.circle,
                                            ),

                                            child:
                                                const Icon(
                                              Icons
                                                  .favorite_border,
                                              size: 19,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  product['name'],

                                  maxLines: 1,

                                  overflow:
                                      TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 3),

                                Text(
                                  '\$${product['price'].toStringAsFixed(0)}',

                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
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
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.70,
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 25),
                  ),
                ],
              ),
            ),

            // ================= BOTTOM NAVIGATION =================

            Container(
              height: 75,

              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,

                children: [

                  _bottomItem(
                    Icons.home_rounded,
                    'Home',
                    true,
                  ),

                  _bottomItem(
                    Icons.shopping_bag_outlined,
                    'Cart List',
                    false,
                  ),

                  _bottomItem(
                    Icons.settings_outlined,
                    'Setting',
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomItem(
    IconData icon,
    String title,
    bool selected,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Icon(
          icon,
          size: 26,
          color: selected
              ? const Color(0xFFFFA000)
              : Colors.grey,
        ),

        const SizedBox(height: 4),

        Text(
          title,

          style: TextStyle(
            fontSize: 12,
            color: selected
                ? const Color(0xFFFFA000)
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}