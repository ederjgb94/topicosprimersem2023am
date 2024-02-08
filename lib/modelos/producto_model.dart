class Producto {
  String id;
  String nombre;
  double precio;

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'precio': precio,
    };
  }
}
