import 'package:flutter/material.dart';

class Producto {
  String codigo = '';
  String nombre = '';
  double precio = 0.0;

  Producto({
    required this.codigo,
    required this.nombre,
    required this.precio,
  }) {}

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nombre': nombre,
      'precio': precio,
    };
  }
}
