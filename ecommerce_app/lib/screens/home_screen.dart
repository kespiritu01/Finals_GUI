import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../data/products.dart';
import 'product_detail_screen.dart';
import 'shopping_cart_screen.dart'; 

class HomeScreen extends StatefulWidget {
  final Function(Product) onAddToCart;

  const HomeScreen({Key? key, required this.onAddToCart}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> productsList;
  int _selectedIndex = 0;

  // Cart items stored here
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    productsList = products;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToCart(Product product) {
    setState(() {

      int index = cartItems.indexWhere((item) => item.product.id == product.id);
      if (index >= 0) {
        cartItems[index].quantity += 1;
      } else {
        cartItems.add(CartItem(product: product, quantity: 1));
      }
    });
  }

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      if (newQuantity <= 0) {
        cartItems.removeAt(index);
      } else {
        cartItems[index].quantity = newQuantity;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  Widget _buildProductsGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,       
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,   
      ),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        final product = productsList[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: product,
                    onAddToCart: (prod) {
                      _addToCart(prod);
                    },
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                        Center(child: Icon(Icons.broken_image, size: 50)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "₱${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.brown.shade700,
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      _buildProductsGrid(),
      ShoppingCartScreen(
        cartItems: cartItems,
        onUpdateQuantity: _updateQuantity,
        onRemoveItem: _removeItem,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Retro Realm'),
        backgroundColor: const Color.fromARGB(255, 89, 134, 149),
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 89, 134, 149),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
