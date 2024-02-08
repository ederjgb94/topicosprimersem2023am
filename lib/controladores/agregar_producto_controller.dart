import 'package:hive/hive.dart';

class AgregarProductoController {
  void agregarProducto(
    String id,
    String nombre,
    String precio,
  ) {
    bool isValid = true;
    //1.-validar primero mis datos de entrada
    //checar que no este vacio
    //checar que corresponda al tipo de dato que espero

    //2.- Agregar producto a la base de datos
    //si y solo si la información es valida

    if (isValid) {
      var productos = Hive.box('productos');
      productos.put(id, {'id': id, 'nombre': nombre, 'precio': precio});
    }
  }
}
