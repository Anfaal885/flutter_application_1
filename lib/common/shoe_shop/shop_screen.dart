import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Nike Air Max',
      'price': 120,
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=700',
    },
    {
      'name': 'Nike Air Force',
      'price': 100,
      'image':
          'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=700',
    },
    {
      'name': 'Nike Running',
      'price': 110,
      'image':
          'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=700',
    },
    {
      'name': 'Nike Casual',
      'price': 95,
      'image':
          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=700',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          'Shop',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // SEARCH
            Container(
              height: 54,

              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(15),
              ),

              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search shoes',

                  prefixIcon: Icon(
                    Icons.search,
                  ),

                  border: InputBorder.none,

                  contentPadding:
                      EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'All Shoes',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: GridView.builder(
                itemCount: products.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  crossAxisSpacing: 14,

                  mainAxisSpacing: 18,

                  childAspectRatio: .68,
                ),

                itemBuilder: (context, index) {
                  final product =
                      products[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius:
                          BorderRadius.circular(18),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.vertical(
                              top: Radius.circular(18),
                            ),

                            child: Image.network(
                              product['image'],

                              width: double.infinity,

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.all(10),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text(
                                product['name'],

                                maxLines: 1,

                                overflow:
                                    TextOverflow.ellipsis,

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              Text(
                                '\$${product['price']}',

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}