import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import 'order_confirmed_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const CheckoutScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  // Shipping info
  String name = '';
  String address = '';
  String city = '';
  String zip = '';

  // Payment methods list
  final List<String> paymentMethods = ['Credit Card', 'PayPal', 'Cash on Delivery'];
  String? selectedPaymentMethod;

  double get subtotal => widget.cartItems.fold(
      0, (sum, item) => sum + item.product.price * item.quantity);

  @override
  void initState() {
    super.initState();
    selectedPaymentMethod = paymentMethods[0];
  }

  void _placeOrder() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OrderConfirmedScreen(cartItems: widget.cartItems),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: const Color.fromARGB(255, 89, 134, 149),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shipping Address', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter your name' : null,
                    onSaved: (val) => name = val ?? '',
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter your address' : null,
                    onSaved: (val) => address = val ?? '',
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter your city' : null,
                    onSaved: (val) => city = val ?? '',
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Zip Code'),
                    keyboardType: TextInputType.number,
                    validator: (val) => val == null || val.isEmpty ? 'Enter your zip code' : null,
                    onSaved: (val) => zip = val ?? '',
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text('Payment Method', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Column(
              children: paymentMethods.map((method) {
                return RadioListTile<String>(
                  title: Text(method),
                  value: method,
                  groupValue: selectedPaymentMethod,
                  onChanged: (val) {
                    setState(() {
                      selectedPaymentMethod = val;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            Text('Order Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ...widget.cartItems.map((item) => ListTile(
                  title: Text(item.product.name),
                  trailing: Text('₱${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                  subtitle: Text('Qty: ${item.quantity}'),
                )),
            Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Subtotal: ₱${subtotal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 89, 134, 149),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: _placeOrder,
                child: Text('Place Order', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
