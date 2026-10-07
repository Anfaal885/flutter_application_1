import 'package:flutter/material.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  int selectedNav = 2;

  final Color bgColor = const Color(0xffF3F7EF);

  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Melting Cheese Pizza",
      "price": 35.00,
      "quantity": 2,
      "image":
          "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500",
    },
    {
      "name": "Spinach & Chicken",
      "price": 16.00,
      "quantity": 2,
      "image":
          "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500",
    },
    {
      "name": "Fresh Watermelon",
      "price": 10.00,
      "quantity": 2,
      "image":
          "https://images.unsplash.com/photo-1563114773-84221bd62daa?w=500",
    },
    {
      "name": "Organic Spinach",
      "price": 4.00,
      "quantity": 2,
      "image":
          "https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=500",
    },
  ];

  double get total {
    double value = 0;

    for (final item in cartItems) {
      value += item["price"] * item["quantity"];
    }

    return value;
  }

  void increase(int index) {
    setState(() {
      cartItems[index]["quantity"]++;
    });
  }

  void decrease(int index) {
    if (cartItems[index]["quantity"] > 1) {
      setState(() {
        cartItems[index]["quantity"]--;
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // APP BAR
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 18,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Cart List",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.search,
                          size: 21,
                        ),
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.person_outline,
                          size: 21,
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // DELIVERY LOCATION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Location",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Change Location",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // CART ITEMS
                    ListView.builder(
                      itemCount: cartItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];

                        final double itemTotal =
                            item["price"] * item["quantity"];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(8),
                          height: 101,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Row(
                            children: [
                              // PRODUCT IMAGE
                              ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.network(
                                  item["image"],
                                  height: 75,
                                  width: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 10),

                              // DETAILS
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Price Per 1 : \$${item["price"].toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // QUANTITY
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => decrease(index),
                                          child: const Text(
                                            "−",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 13),
                                        Text(
                                          "${item["quantity"]}",
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 13),
                                        GestureDetector(
                                          onTap: () => increase(index),
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // RIGHT SIDE
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () => removeItem(index),
                                    child: const Icon(
                                      Icons.delete_outline,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    "\$${itemTotal.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(width: 5),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // BOTTOM NAVIGATION
            Container(
              margin: const EdgeInsets.fromLTRB(22, 5, 22, 12),
              height: 62,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navIcon(Icons.home_outlined, false, () {
                    Navigator.pop(context);
                  }),
                  _navIcon(Icons.content_cut, false, () {}),
                  _navIcon(Icons.shopping_bag_outlined, true, () {}),
                  _navIcon(Icons.card_giftcard_outlined, false, () {}),
                  _navIcon(Icons.person_outline, false, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(
    IconData icon,
    bool selected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xffD8F0EC)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 21,
          color: selected
              ? const Color(0xff238B84)
              : Colors.black87,
        ),
      ),
    );
  }
}