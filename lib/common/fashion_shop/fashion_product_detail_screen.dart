import 'package:flutter/material.dart';

class FashionProductDetailScreen
    extends StatefulWidget {
  const FashionProductDetailScreen({super.key});

  @override
  State<FashionProductDetailScreen> createState() =>
      _FashionProductDetailScreenState();
}

class _FashionProductDetailScreenState
    extends State<FashionProductDetailScreen> {
  int selectedImage = 0;
  int quantity = 1;

  final List<String> images = [
    'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?w=900',
    'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=900',
    'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=900',
    'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=900',
    'https://images.unsplash.com/photo-1523398002811-999ca8dec234?w=900',
    'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=900',
    'https://images.unsplash.com/photo-1603252110481-7ba873bf42ab?w=900',
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
                physics:
                    const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // ---------------- TOP BAR ----------------

                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        15,
                        18,
                        0,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.favorite,
                            size: 20,
                            color: Color(0xffd16d7d),
                          ),
                          const SizedBox(width: 18),
                          const Icon(
                            Icons.share_outlined,
                            size: 20,
                          ),
                          const SizedBox(width: 18),
                          Stack(
                            clipBehavior:
                                Clip.none,
                            children: [
                              const Icon(
                                Icons.shopping_bag_outlined,
                                size: 21,
                              ),
                              Positioned(
                                right: -5,
                                top: -6,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration:
                                      BoxDecoration(
                                    color: const Color(
                                      0xffd96f7c,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color:
                                            Colors.white,
                                        fontSize: 7,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ---------------- PRODUCT IMAGE AREA ----------------

                    SizedBox(
                      height: 330,
                      child: Row(
                        children: [
                          // LEFT SCROLLABLE IMAGES
                          SizedBox(
                            width: 72,
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.only(
                                left: 15,
                                top: 2,
                                bottom: 5,
                              ),
                              physics:
                                  const BouncingScrollPhysics(),
                              itemCount:
                                  images.length,
                              itemBuilder:
                                  (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedImage =
                                          index;
                                    });
                                  },
                                  child: Container(
                                    height: 58,
                                    width: 48,
                                    margin:
                                        const EdgeInsets
                                            .only(
                                      bottom: 10,
                                    ),
                                    decoration:
                                        BoxDecoration(
                                      color:
                                          const Color(
                                        0xffeeeae1,
                                      ),
                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                        5,
                                      ),
                                      border: Border.all(
                                        width: 1.4,
                                        color:
                                            selectedImage ==
                                                    index
                                                ? Colors
                                                    .black
                                                : Colors
                                                    .transparent,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                        5,
                                      ),
                                      child:
                                          Image.network(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // MAIN IMAGE
                          Expanded(
                            child: Container(
                              height: 325,
                              margin:
                                  const EdgeInsets.only(
                                right: 18,
                              ),
                              decoration:
                                  BoxDecoration(
                                color:
                                    const Color(
                                  0xffeeeae1,
                                ),
                                borderRadius:
                                    BorderRadius.circular(
                                  8,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(
                                  8,
                                ),
                                child: Image.network(
                                  images[selectedImage],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ---------------- DETAILS ----------------

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.storefront_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'tulipworld',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors
                                      .grey.shade600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Essentials Men's Short-Sleeve",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),

                          const Text(
                            'Crewneck T-Shirt',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 9),

                          // RATINGS
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                size: 13,
                                color:
                                    Color(0xffd5a447),
                              ),
                              SizedBox(width: 3),
                              Text(
                                '4.9 Ratings',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 14),
                              Text(
                                '2.3k+ Reviews',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 14),
                              Text(
                                '2.9k+ Sold',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 21),

                          // TABS
                          const Row(
                            children: [
                              Text(
                                'About Item',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 55),
                              Text(
                                'Reviews',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 7),

                          Container(
                            width: 67,
                            height: 2,
                            color:
                                const Color(0xff5b9273),
                          ),

                          const SizedBox(height: 16),

                          // BRAND + COLOR
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: const [
                              Text(
                                'Brand',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'CharmkR',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                              ),
                              Text(
                                'Color',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Aprikot',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          const Text(
                            'Material',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            'Premium cotton fabric',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Product Description',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Comfortable everyday fashion shirt '
                            'with a simple modern design. '
                            'Perfect for casual wear and daily '
                            'styling.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 35),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------- BOTTOM BAR ----------------

            Container(
              height: 75,
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color(0xffeeeeee),
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '\$18.00',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              Color(0xff4f8e6c),
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Container(
                      height: 38,
                      width: 62,
                      decoration: BoxDecoration(
                        color:
                            const Color(0xff58a079),
                        borderRadius:
                            BorderRadius.circular(
                          5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons
                                .shopping_bag_outlined,
                            color: Colors.white,
                            size: 17,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '$quantity',
                            style:
                                const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 5),

                  Container(
                    height: 38,
                    width: 88,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
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