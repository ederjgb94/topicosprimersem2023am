import 'package:clasetopicosuno/modelos/producto_model.dart';
import 'package:hive/hive.dart';

class VerProductosController {
  List<Producto> obtenerProductos() {
    var productos = Hive.box('productos');
    List<Producto> listaProductos = [];

    for (var producto in productos.values) {
      listaProductos.add(Producto(
        id: producto['id'],
        nombre: producto['nombre'],
        precio: double.parse(producto['precio']),
      ));
    }

    return listaProductos;
  }
}
