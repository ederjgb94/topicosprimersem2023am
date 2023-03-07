import 'package:clasetopicosuno/producto.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class VerProductos extends StatelessWidget {
  final List<Producto> productos;
  const VerProductos({
    super.key,
    required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    var boxproductos = Hive.box('productos').values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView(
        // children: productos
        children: boxproductos
            .map(
              (producto) => Container(
                child: Row(
                  children: [
                    Text(producto.codigo),
                    Text(producto.nombre),
                    Text(producto.precio.toString()),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
