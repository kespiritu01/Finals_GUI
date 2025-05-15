import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_options_selector.dart'; // Import the selectors

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const ProductDetailScreen({Key? key, required this.product, required this.onAddToCart}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  String? selectedSize;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: const Color.fromARGB(255, 89, 134, 149),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Large Product Image
              Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Center(child: Icon(Icons.broken_image, size: 100)),
              ),
              SizedBox(height: 16),
              // Product Name
              Text(
                product.name,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // Product Price
              Text("₱${product.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 24)),
              SizedBox(height: 12),
              // Full Description
              Text(product.description),
              SizedBox(height: 12),
              // Availability
              Text(product.available ? "Available" : "Out of Stock", style: TextStyle(color: product.available ? Colors.green : Colors.red)),
              SizedBox(height: 24),
              // Quantity Selector
              ProductQuantitySelector(
                quantity: quantity,
                onQuantityChanged: (newQuantity) {
                  setState(() {
                    quantity = newQuantity;
                  });
                },
              ),
              // Size Selector (if applicable)
              if (product.sizes != null && product.sizes!.isNotEmpty)
                ProductSizeSelector(
                  sizes: product.sizes!,
                  selectedSize: selectedSize ?? product.sizes!.first,
                  onSizeSelected: (size) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                ),
              // Color Selector (if applicable)
              if (product.colors != null && product.colors!.isNotEmpty)
                ProductColorSelector(
                  colors: product.colors!,
                  selectedColor: selectedColor ?? product.colors!.first,
                  onColorSelected: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
              SizedBox(height: 24),
              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  for (var i = 0; i < quantity; i++) {
                    widget.onAddToCart(product);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} added to cart')),
                  );
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}