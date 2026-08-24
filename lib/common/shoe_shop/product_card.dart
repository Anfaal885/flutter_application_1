import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final String name;
  final double price;
  final String image;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(18),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Expanded(
            child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),

                borderRadius:
                    BorderRadius.circular(18),
              ),

              clipBehavior:
                  Clip.antiAlias,

              child: Stack(
                children: [

                  Positioned.fill(
                    child: Image.network(
                      image,

                      fit: BoxFit.cover,

                      errorBuilder:
                          (_, __, ___) {

                        return const Center(
                          child: Icon(
                            Icons
                                .image_not_supported_outlined,

                            size: 40,

                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,

                    child: Container(
                      width: 32,
                      height: 32,

                      decoration:
                          const BoxDecoration(
                        color: Colors.white70,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.favorite_border,
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
            name,

            maxLines: 1,

            overflow:
                TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            '\$${price.toStringAsFixed(0)}',

            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}