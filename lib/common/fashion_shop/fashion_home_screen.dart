import 'package:flutter/material.dart';
import 'fashion_products_screen.dart';

class FashionHomeScreen extends StatefulWidget {
  const FashionHomeScreen({super.key});

  @override
  State<FashionHomeScreen> createState() => _FashionHomeScreenState();
}

class _FashionHomeScreenState extends State<FashionHomeScreen> {
  int selectedBottom = 0;

  final List<Map<String, dynamic>> products = [
    {
      'image':
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=700',
      'price': '\$12.00',
      'name': "Essentials Men's Short-Sleeve Crewneck T-Shirt",
    },
    {
      'image':
          'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?w=700',
      'price': '\$18.00',
      'name': "Essentials Men's Short-Sleeve Crewneck T-Shirt",
    },
    {
      'image':
          'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=700',
      'price': '\$32.00',
      'name': "Essentials Men's Regular-Fit Long-Sleeve Oxford",
    },
    {
      'image':
          'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=700',
      'price': '\$22.00',
      'name': "Essentials Men's Regular-Fit Long-Sleeve Oxford",
    },
    {
      'image':
          'https://images.unsplash.com/photo-1523398002811-999ca8dec234?w=700',
      'price': '\$25.00',
      'name': "Men's Casual Cotton Shirt",
    },
    {
      'image':
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=700',
      'price': '\$28.00',
      'name': "Women's Casual Fashion Shirt",
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------------- TOP SEARCH ----------------

                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        14,
                        18,
                        4,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(13),
                              ),
                              child: const Row(
                                children: [
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Color(0xffaaa8a3),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xffaaa8a3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          _notificationIcon(
                            Icons.shopping_bag_outlined,
                            '1',
                          ),
                          const SizedBox(width: 13),
                          _notificationIcon(
                            Icons.chat_bubble_outline,
                            '3',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ---------------- SALE BANNER ----------------

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Container(
                        height: 158,
                        width: double.infinity,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0xfff1efe7),
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 14,
                                top: 18,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'FASHION DAY',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '80% OFF',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight:
                                          FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Discount from 12th - 20th',
                                    style: TextStyle(
                                      fontSize: 7,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Dec 2025',
                                    style: TextStyle(
                                      fontSize: 7,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  _CheckButton(),
                                ],
                              ),
                            ),

                            Positioned(
                              right: -8,
                              bottom: 0,
                              child: SizedBox(
                                height: 140,
                                width: 155,
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=700',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 17),

                    // ---------------- CATEGORIES ----------------

                    SizedBox(
                      height: 78,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          _category(
                            Icons.category_outlined,
                            'Categories',
                          ),
                          _category(
                            Icons.local_offer_outlined,
                            'Styles',
                          ),
                          _category(
                            Icons.shopping_bag_outlined,
                            'Bags',
                          ),
                          _category(
                            Icons.public,
                            'Global picks',
                          ),
                          _category(
                            Icons.search,
                            'See All',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ---------------- BEST SALE TITLE ----------------

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const FashionProductsScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'See more',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 13),

                    // ---------------- FIRST ROW ----------------

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _productCard(
                              context,
                              products[0],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _productCard(
                              context,
                              products[1],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 27),

                    // ---------------- SECOND ROW ----------------

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _productCard(
                              context,
                              products[2],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _productCard(
                              context,
                              products[3],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 27),

                    // ---------------- THIRD ROW ----------------

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _productCard(
                              context,
                              products[4],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _productCard(
                              context,
                              products[5],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),

            // ---------------- BOTTOM NAV ----------------

            _bottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _productCard(
    BuildContext context,
    Map<String, dynamic> product,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const FashionProductsScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

              const Positioned(
                right: 8,
                top: 8,
                child: Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Color(0xff77736d),
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
                size: 11,
                color: Color(0xffd5a447),
              ),
              const SizedBox(width: 2),
              const Text(
                '4.9 | 250',
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
      ),
    );
  }

  Widget _notificationIcon(
    IconData icon,
    String number,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          icon,
          size: 23,
          color: Colors.grey.shade700,
        ),
        Positioned(
          right: -4,
          top: -5,
          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
              color: const Color(0xffd96f7c),
              borderRadius:
                  BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _category(
    IconData icon,
    String text,
  ) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 22,
          color: Colors.grey.shade700,
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 8,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _bottomNavigation() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xffeeeeee),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: [
          _bottomItem(
            Icons.home_outlined,
            'Home',
            0,
          ),
          _bottomItem(
            Icons.confirmation_number_outlined,
            'Voucher',
            1,
          ),
          _bottomItem(
            Icons.account_balance_wallet_outlined,
            'Wallet',
            2,
          ),
          _bottomItem(
            Icons.settings_outlined,
            'Settings',
            3,
          ),
        ],
      ),
    );
  }

  Widget _bottomItem(
    IconData icon,
    String title,
    int index,
  ) {
    final selected = selectedBottom == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBottom = index;
        });
      },
      child: Column(
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
      ),
    );
  }
}

class _CheckButton extends StatelessWidget {
  const _CheckButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius:
            BorderRadius.circular(5),
      ),
      child: const Text(
        'Check this out',
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
        ),
      ),
    );
  }
}