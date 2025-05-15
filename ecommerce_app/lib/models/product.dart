import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String shortDescription;
  final String description;
  final double rating;
  final bool available;
  final List<String>? sizes;
  final List<Color>? colors;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.shortDescription,
    required this.description,
    required this.rating,
    this.available = true,
    this.sizes,
    this.colors,
  });
}