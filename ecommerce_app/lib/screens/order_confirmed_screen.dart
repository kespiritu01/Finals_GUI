import 'package:flutter/material.dart';
import 'home_screen.dart'; 
import '../models/cart_item.dart'; 

// Stateless widget that shows order confirmation details
class OrderConfirmedScreen extends StatelessWidget {
  final List<CartItem> cartItems; // List of cart items passed to the screen

  const OrderConfirmedScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color of the entire screen
      backgroundColor: const Color.fromARGB(255, 206, 205, 205), 
      
      // App bar with title and custom color scheme
      appBar: AppBar(
        title: Text(
          'Order Confirmed',
          style: TextStyle(color: Colors.white), // White text for title
        ),
        backgroundColor: const Color.fromARGB(255, 89, 134, 149), // Custom app bar color
        iconTheme: IconThemeData(color: Colors.white), // White color for back arrow icon
      ),
      
      // Main content of the screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
          children: [
            // Confirmation icon
            Icon(
              Icons.check_circle_outline, 
              color: const Color.fromARGB(255, 245, 247, 246), 
              size: 80,
            ),
            SizedBox(height: 20), // Space between icon and text

            // Thank-you message
            Text(
              'Thank you for your order!',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20), // Space between text and button

            // "Go to Home" button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 89, 134, 149), // Button background
                foregroundColor: Colors.white, // Button text color
              ),
              onPressed: () {
                // Navigate back to the HomeScreen and remove all previous routes
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      onAddToCart: (product) {
                        // Placeholder function for adding to cart
                      },
                    ),
                  ),
                  (route) => false, // Clears navigation stack
                );
              },
              child: Text('Go to Home'), // Button label
            ),
          ],
        ),
      ),
    );
  }
}
