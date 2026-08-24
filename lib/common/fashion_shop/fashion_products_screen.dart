import 'package:flutter/material.dart';
import 'fashion_product_detail_screen.dart';

class FashionProductsScreen extends StatelessWidget {
  const FashionProductsScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'image':
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=700',
      'price': '\$12.00',
      'name': "Essentials Men's Short-Sleeve Crewneck T-Shirt",
      'favorite': false,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?w=700',
      'price': '\$18.00',
      'name': "Essentials Men's Short-Sleeve Crewneck T-Shirt",
      'favorite': true,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=700',
      'price': '\$32.00',
      'name': "Essentials Men's Short-Sleeve Crewneck T-Shirt",
      'favorite': false,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=700',
      'price': '\$22.00',
      'name': "Essentials Men's Regular-Fit Long-Sleeve Oxford",
      'favorite': false,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1523398002811-999ca8dec234?w=700',
      'price': '\$16.00',
      'name': "Men's Casual Cotton Shirt",
      'favorite': false,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=700',
      'price': '\$25.00',
      'name': "Women's Casual Fashion Shirt",
      'favorite': true,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1603252110481-7ba873bf42ab?w=700',
      'price': '\$29.00',
      'name': "Classic Casual Shirt",
      'favorite': false,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1564257577054-8f8b1e7d1e8e?w=700',
      'price': '\$35.00',
      'name': "Modern Fashion Shirt",
      'favorite': false,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=700',
      'price': '\$20.00',
      'name': "Casual Regular Fit Shirt",
      'favorite': false,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=700',
      'price': '\$27.00',
      'name': "Premium Cotton Shirt",
      'favorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf9f5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics:
                    const BouncingScrollPhysics(),
                slivers: [
                  // SEARCH BAR
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        15,
                        18,
                        0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              child: const Row(
                                children: [
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.shopping_bag_outlined,
                            size: 22,
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.chat_bubble_outline,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // TITLE
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        38,
                        18,
                        15,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Best Sale Product',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See more',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // GRID
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
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
                                      const FashionProductDetailScreen(),
                                ),
                              );
                            },
                            child: _productCard(
                              product,
                            ),
                          );
                        },
                        childCount: products.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 26,
                        childAspectRatio: 0.66,
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 25),
                  ),
                ],
              ),
            ),

            // BOTTOM NAVIGATION
            Container(
              height: 70,
              color: Colors.white,
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(
                    Icons.home_outlined,
                    'Home',
                    true,
                  ),
                  _NavItem(
                    Icons.confirmation_number_outlined,
                    'Voucher',
                    false,
                  ),
                  _NavItem(
                    Icons.account_balance_wallet_outlined,
                    'Wallet',
                    false,
                  ),
                  _NavItem(
                    Icons.settings_outlined,
                    'Settings',
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

  Widget _productCard(
    Map<String, dynamic> product,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 145,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffeeeae1),
                borderRadius:
                    BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8),
                child: Image.network(
                  product['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              right: 7,
              top: 7,
              child: Icon(
                product['favorite']
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 19,
                color: product['favorite']
                    ? const Color(0xffd06d7d)
                    : Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 7),

        const Text(
          'Shirt',
          style: TextStyle(
            fontSize: 8,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          product['name'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 5),

        Row(
          children: [
            const Icon(
              Icons.star,
              size: 10,
              color: Color(0xffd5a447),
            ),
            const Text(
              ' 4.9 | 250',
              style: TextStyle(
                fontSize: 8,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Text(
              product['price'],
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xff5c8d70),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;

  const _NavItem(
    this.icon,
    this.title,
    this.selected,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 22,
          color: selected
              ? const Color(0xff4b9b73)
              : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 8,
            color: selected
                ? const Color(0xff4b9b73)
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}