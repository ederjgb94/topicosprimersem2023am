import 'package:clasetopicosuno/producto.dart';
import 'package:flutter/material.dart';

class VerProductos extends StatelessWidget {
  final List<Producto> productos;
  const VerProductos({
    super.key,
    required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView(
        children: productos
            .map(
              (e) => Container(
                child: Row(
                  children: [
                    Text(e.codigo),
                    Text(e.nombre),
                    Text(e.precio.toString()),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
