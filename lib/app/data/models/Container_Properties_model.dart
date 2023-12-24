import 'package:flutter/material.dart';

class ContainerProperties {
  final Size size;
  final double radius;
  final EdgeInsetsGeometry margin;
  final Color color;
  final int count;

  ContainerProperties({required this.size, required this.radius, required this.margin, required this.color, this.count = 0});
}
