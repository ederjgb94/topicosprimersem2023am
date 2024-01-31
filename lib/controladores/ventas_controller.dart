import 'dart:math';

import 'package:clasetopicosuno/modelos/producto_model.dart';

class VentasController {
  List<Producto> productos = [
    Producto(id: 1, nombre: 'Coca', precio: 87.65),
    Producto(id: 2, nombre: 'Pepsi', precio: 67.65),
    Producto(id: 3, nombre: 'Fanta', precio: 57.65),
  ];

  void agregarProducto(id, nombre, precio) {
    Producto producto = Producto(
      id: id,
      nombre: nombre,
      precio: precio,
    );
    productos.add(producto);
  }

  void eliminarProducto() {
    print('Venta eliminada');
  }

  void modificarProducto() {
    print('Venta modificada');
  }

  List<Producto> verProductos() {
    return productos;
  }

  void agregarProductoAleatorio() {
    List<String> nombres = ['Coca', 'Pepsi', 'Fanta', 'Sprite'];
    List<double> precios = [87.65, 67.65, 57.65, 47.65];

    productos.add(
      Producto(
        id: Random().nextInt(100),
        nombre: nombres[Random().nextInt(nombres.length)],
        precio: precios[Random().nextInt(precios.length)],
      ),
    );
  }
}
