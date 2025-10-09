import 'package:flutter/material.dart';

class JewelryItem {
  final String id;
  final String imageUrl;
  final String category; // Necklaces, Earrings, Bangles, Bridal Sets
  final String title;

  const JewelryItem({required this.id, required this.imageUrl, required this.category, required this.title});
}
