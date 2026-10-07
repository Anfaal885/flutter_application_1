import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBottom = 0;

  final List<Product> products = [
    Product(
      name: 'iPhone 12',
      price: '\$765.00',
      images: [
        'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?w=800',
        'https://images.unsplash.com/photo-1592286927505-2fd9f0b5f5d6?w=800',
      ],
    ),

    Product(
      name: 'Hoodi Yellow',
      price: '\$69.00',
      images: [
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=800',
        'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=800',
        'https://images.unsplash.com/photo-1578681994506-b8f463449011?w=800',
      ],
    ),

    Product(
      name: 'Apple Watch 6',
      price: '\$395.00',
      images: [
        'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=800',
        'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?w=800',
      ],
    ),

    Product(
      name: 'Men Shoes',
      price: '\$450.00',
      images: [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
        'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
      ],
    ),

    Product(
      name: 'Summer T-Shirt',
      price: '\$45.00',
      images: [
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800',
        'https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=800',
      ],
    ),

    Product(
      name: 'Perfume',
      price: '\$89.00',
      images: [
        'https://images.unsplash.com/photo-1541643600914-78b084683601?w=800',
        'https://images.unsplash.com/photo-1594035910387-fea47794261f?w=800',
      ],
    ),

    Product(
      name: 'Sneakers',
      price: '\$120.00',
      images: [
        'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=800',
        'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=800',
      ],
    ),

    Product(
      name: 'Backpack',
      price: '\$59.00',
      images: [
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800',
        'https://images.unsplash.com/photo-1622560480605-d83c853bc5c3?w=800',
      ],
    ),
  ];

  void openProduct(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f8fa),

      body: SafeArea(
        child: Column(
          children: [

            // TOP HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                10,
              ),
              child: Row(
                children: [

                  const Expanded(
                    child: Text(
                      'Online Shop',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 27,
                    ),
                  ),

                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mark_email_unread_outlined,
                          size: 25,
                        ),
                      ),
                      Positioned(
                        right: 7,
                        top: 5,
                        child: Container(
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          size: 27,
                        ),
                      ),
                      Positioned(
                        right: 7,
                        top: 5,
                        child: Container(
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // RECOMMENDATION
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                8,
                18,
                12,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    'Recommendation',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Icon(
                    Icons.grid_view_rounded,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
            ),

            // PRODUCT GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                itemCount: products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {

                  final product = products[index];

                  return GestureDetector(
                    onTap: () {
                      openProduct(product);
                    },
                    child: ProductCard(
                      product: product,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: selectedBottom,
          onTap: (index) {
            setState(() {
              selectedBottom = index;
            });
          },
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}


// PRODUCT CARD
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // IMAGE BOX
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xfff0eef2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Stack(
              children: [

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.network(
                      product.images.first,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_not_supported,
                          size: 45,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),

                // HEART
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.favorite_border,
                    size: 22,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        // NAME
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          child: Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 4),

        // PRICE + BUY
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [

            Text(
              product.price,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xffa88a62),
                fontWeight: FontWeight.w500,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Buy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}