import 'package:flutter/material.dart';

class ContainerProperties {
  final Size size;
  final double radius;
  final EdgeInsetsGeometry margin;
  final Color color;
  final int count;
  ImageProvider<Object>? image;

  ContainerProperties({required this.size, required this.radius, required this.margin, required this.color, this.count = 0, this.image});
}
