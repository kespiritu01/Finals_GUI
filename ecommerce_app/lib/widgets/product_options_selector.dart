import 'package:flutter/material.dart';

class ProductSizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  const ProductSizeSelector({
    Key? key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Size:",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.brown.shade800),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: sizes.map((size) {
            final selected = size == selectedSize;
            return ChoiceChip(
              label: Text(size),
              selected: selected,
              selectedColor: Colors.brown.shade300,
              backgroundColor: Colors.brown.shade100,
              labelStyle: TextStyle(
                  color:
                      selected ? Colors.brown.shade900 : Colors.brown.shade700,
                  fontWeight: FontWeight.w600),
              onSelected: (bool selected) {
                if (selected) {
                  onSizeSelected(size);
                }
              },
            );
          }).toList(),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class ProductColorSelector extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ProductColorSelector({
    Key? key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Color:",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.brown.shade800),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: colors.map((color) {
            final selected = color == selectedColor;
            return GestureDetector(
              onTap: () => onColorSelected(color),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: selected
                      ? Border.all(color: Colors.brown.shade900, width: 3)
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class ProductQuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const ProductQuantitySelector({
    Key? key,
    required this.quantity,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quantity:",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.brown.shade800),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline, color: Colors.brown.shade700),
              iconSize: 32,
              onPressed: quantity > 1 ? () => onQuantityChanged(quantity - 1) : null,
            ),
            SizedBox(width: 16),
            Text(
              quantity.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.brown.shade700),
              iconSize: 32,
              onPressed: () => onQuantityChanged(quantity + 1),
            ),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }
}