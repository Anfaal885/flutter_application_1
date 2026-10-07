import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final List<String> images;

  Product({
    required this.name,
    required this.price,
    required this.images,
  });
}

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedColor = 0;
  int selectedSize = 1;
  int currentImage = 0;

  final List<Color> colors = [
    Colors.green,
    Colors.orange,
    Colors.grey,
  ];

  final List<String> sizes = [
    'XL',
    'L',
    'M',
    'S',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f8fa),

      body: SafeArea(
        child: Column(
          children: [

            // TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),

                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 24,
                  ),
                ],
              ),
            ),

            // SCROLLABLE DETAIL AREA
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // PRODUCT IMAGE
                    SizedBox(
                      height: 390,
                      child: PageView.builder(
                        itemCount: widget.product.images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentImage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                color: const Color(0xfffff1df),
                                child: Image.network(
                                  widget.product.images[index],
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.image_not_supported,
                                      size: 60,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),

                    // IMAGE DOTS
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.product.images.length,
                          (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              width: currentImage == index ? 25 : 7,
                              height: 4,
                              decoration: BoxDecoration(
                                color: currentImage == index
                                    ? Colors.black
                                    : Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // NAME + STOCK
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          Expanded(
                            child: Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.only(top: 7),
                            child: Text(
                              'Available in Stock',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // PRICE + COLORS
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            widget.product.price,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffd69b3c),
                            ),
                          ),

                          Row(
                            children: List.generate(
                              colors.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 8,
                                    ),
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            selectedColor == index
                                                ? Colors.black
                                                : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // SIZES
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: List.generate(
                          sizes.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 7,
                                ),
                                width: 43,
                                height: 43,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedSize == index
                                      ? const Color(0xffffddd5)
                                      : const Color(0xfff1eff1),
                                  borderRadius:
                                      BorderRadius.circular(9),
                                ),
                                child: Text(
                                  sizes[index],
                                  style: TextStyle(
                                    fontWeight:
                                        selectedSize == index
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // DESCRIPTION
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Text(
                        'The oversized hoodie remains popular for its effortless '
                        'relaxed vibe, perfect for layering over turtlenecks '
                        'or under structured coats.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),

            // ADD TO CART
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                8,
                18,
                15,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to Cart'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffe11d12),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}