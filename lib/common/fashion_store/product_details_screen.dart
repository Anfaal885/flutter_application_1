import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String price;
  final List<String> images;

  const ProductDetailsScreen({
    super.key,
    required this.productName,
    required this.price,
    required this.images,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {
  int currentImage = 0;
  int selectedColor = 0;
  int quantity = 1;

  final List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.deepOrange,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // TOP
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.share_outlined,
                        size: 20,
                      ),
                      SizedBox(width: 18),
                      Icon(
                        Icons.favorite_border,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // MULTIPLE IMAGES
            SizedBox(
              height: 290,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.images.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentImage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xfff6f6f6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              widget.images[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // DOTS
                  Positioned(
                    bottom: 4,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.images.length,
                        (index) {
                          return Container(
                            width: currentImage == index ? 13 : 6,
                            height: 4,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: currentImage == index
                                  ? Colors.black
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // DETAILS
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffffe4d1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            '4.8',
                            style: TextStyle(
                              color: Color(0xfff36f16),
                              fontSize: 8,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 12,
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Seller: ',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Tariqul Islom',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 7),

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
                              width: 23,
                              height: 23,
                              margin:
                                  const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: colors[index],
                                shape: BoxShape.circle,
                                border: selectedColor == index
                                    ? Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      )
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 13),

                    Row(
                      children: [
                        Container(
                          height: 30,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xfff36f16),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: const Center(
                            child: Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 22),
                        const Text(
                          'Specifications',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 22),
                        const Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Premium quality product with modern design. '
                      'Comfortable and stylish for everyday use. '
                      'This product is made with high quality '
                      'material and provides excellent performance '
                      'and comfort.',
                      style: TextStyle(
                        fontSize: 9,
                        height: 1.6,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // BOTTOM ADD TO CART
      bottomSheet: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 9,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 85,
              height: 38,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: const Text('-'),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: const Text('+'),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: SizedBox(
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to Cart'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff36f16),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
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