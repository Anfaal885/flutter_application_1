import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  final List<Map<String, String>> cartItems = const [
    {
      'name': 'Nashville Armchair',
      'price': '1,895',
      'image':
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=500',
    },
    {
      'name': 'Elsa Wingback Chair',
      'price': '1,512',
      'image':
          'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=500',
    },
    {
      'name': 'Ellington Office Chair',
      'price': '12,834',
      'image':
          'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?w=500',
    },
    {
      'name': 'Choise Corner Sofa',
      'price': '82,000',
      'image':
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f3eb),
      body: SafeArea(
        child: Column(
          children: [
            // CART HEADER
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 17,
              ),
              child: Row(
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

                  const Expanded(
                    child: Center(
                      child: Text(
                        'CART',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.more_horiz,
                    size: 22,
                  ),
                ],
              ),
            ),

            // ITEMS
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 5,
                ),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      vertical: 9,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                            color: const Color(0xffe7e3da),
                            borderRadius:
                                BorderRadius.circular(6),
                          ),
                          child: Image.network(
                            item['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(width: 13),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item['name']!,
                                      style: const TextStyle(
                                        fontFamily: 'serif',
                                        fontSize: 12,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    '₹${item['price']}',
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              const Text(
                                'Quantity: 1',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(height: 6),

                              const Text(
                                'REMOVE',
                                style: TextStyle(
                                  color: Color(0xff174fd5),
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
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

            // TOTAL + BUY NOW
            Container(
              padding: const EdgeInsets.fromLTRB(
                22,
                12,
                22,
                18,
              ),
              color: const Color(0xfff6f3eb),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Price For 4 Item(s)',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '₹99,241',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 112,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff174fd5),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(9),
                        ),
                      ),
                      child: const Text(
                        'BUY NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
}