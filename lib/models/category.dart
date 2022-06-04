
import 'package:flutter/material.dart';

class Category {
  final String itemId;
  final String title;
  final Color backgroundColor;

  const Category({ //properties cannot be changed when created
    required this.itemId,
    required this.title,
    this.backgroundColor = Colors.orange});
}