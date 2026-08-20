import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final String name;
  final String price;
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

    return GestureDetector(
      onTap: onTap,

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ================= IMAGE =================

          Expanded(
            child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),

                borderRadius:
                    BorderRadius.circular(16),
              ),

              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(16),

                child: Image.network(
                  image,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {

                    return const Center(
                      child: Icon(
                        Icons
                            .shopping_bag_outlined,
                        size: 60,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ================= NAME =================

          Text(
            name,

            maxLines: 1,

            overflow:
                TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          // ================= PRICE =================

          Text(
            price,

            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}