import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ProductsDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductsDetailPage({super.key, required this.product});

  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      context.read<CartProvider>().addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectedSize,
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Product added successfully!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please select a size!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                widget.product['title'] as String,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 200,
                child: Image.asset(widget.product['imageUrl'] as String),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    '\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor:
                                  selectedSize == size
                                      ? Theme.of(context).primaryColor
                                      : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        fixedSize: Size(350, 50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
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
