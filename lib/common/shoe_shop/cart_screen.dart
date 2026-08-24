import 'package:flutter/material.dart';
import 'cart_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() =>
      _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    CartData.instance.addListener(_updateScreen);
  }

  @override
  void dispose() {
    CartData.instance.removeListener(
      _updateScreen,
    );

    super.dispose();
  }

  void _updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = CartData.instance;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),

        centerTitle: true,

        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: cart.items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 15),

                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Add some shoes to your cart',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.all(20),

                    itemCount: cart.items.length,

                    itemBuilder: (context, index) {
                      final item =
                          cart.items[index];

                      return Container(
                        margin:
                            const EdgeInsets.only(
                          bottom: 16,
                        ),

                        padding:
                            const EdgeInsets.all(
                          10,
                        ),

                        decoration:
                            BoxDecoration(
                          color:
                              const Color(0xFFF6F6F6),

                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),
                        ),

                        child: Row(
                          children: [
                            // IMAGE
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(
                                14,
                              ),

                              child: Image.network(
                                item['image'],

                                width: 105,
                                height: 105,

                                fit: BoxFit.cover,

                                errorBuilder:
                                    (_, __, ___) {
                                  return Container(
                                    width: 105,
                                    height: 105,
                                    color:
                                        Colors.grey[300],

                                    child: const Icon(
                                      Icons
                                          .image_not_supported,
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(
                              width: 14,
                            ),

                            // DETAILS
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item['name'],

                                          maxLines: 1,

                                          overflow:
                                              TextOverflow
                                                  .ellipsis,

                                          style:
                                              const TextStyle(
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight
                                                    .w800,
                                          ),
                                        ),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          cart.removeItem(
                                            index,
                                          );
                                        },

                                        icon:
                                            const Icon(
                                          Icons
                                              .delete_outline,
                                          color:
                                              Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    'Size: ${item['size']}',

                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 6,
                                  ),

                                  Text(
                                    '\$${item['price'].toStringAsFixed(0)}',

                                    style:
                                        const TextStyle(
                                      fontSize: 17,
                                      fontWeight:
                                          FontWeight
                                              .w800,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  Row(
                                    children: [
                                      // MINUS
                                      _quantityButton(
                                        Icons.remove,
                                        () {
                                          cart
                                              .decreaseQuantity(
                                            index,
                                          );
                                        },
                                      ),

                                      Padding(
                                        padding:
                                            const EdgeInsets
                                                .symmetric(
                                          horizontal: 14,
                                        ),

                                        child: Text(
                                          '${item['quantity']}',

                                          style:
                                              const TextStyle(
                                            fontWeight:
                                                FontWeight
                                                    .w700,
                                          ),
                                        ),
                                      ),

                                      // PLUS
                                      _quantityButton(
                                        Icons.add,
                                        () {
                                          cart
                                              .increaseQuantity(
                                            index,
                                          );
                                        },
                                      ),
                                    ],
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

                // TOTAL SECTION
                Container(
                  padding:
                      const EdgeInsets.fromLTRB(
                    22,
                    18,
                    22,
                    20,
                  ),

                  decoration:
                      const BoxDecoration(
                    color: Color(0xFFF8F8F8),

                    borderRadius:
                        BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [
                          const Text(
                            'Total',

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.w700,
                            ),
                          ),

                          Text(
                            '\$${cart.total.toStringAsFixed(2)}',

                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        height: 56,

                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Order placed successfully!',
                                ),
                              ),
                            );
                          },

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.black,

                            foregroundColor:
                                Colors.white,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),

                          child: const Text(
                            'Buy Now',

                            style: TextStyle(
                              fontSize: 17,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _quantityButton(
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(8),

      child: Container(
        width: 30,
        height: 30,

        decoration: BoxDecoration(
          color: Colors.white,

          border:
              Border.all(
            color: Colors.grey.shade300,
          ),

          borderRadius:
              BorderRadius.circular(8),
        ),

        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}