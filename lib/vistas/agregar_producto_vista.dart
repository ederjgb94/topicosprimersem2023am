import 'package:clasetopicosuno/modelos/producto_model.dart';
import 'package:flutter/material.dart';

class AgregarProductoVista extends StatelessWidget {
  final List<Producto> productos;
  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  AgregarProductoVista({super.key, required this.productos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('id'),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Nombre'),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Precio'),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String id = idController.text;
                  String nombre = nombreController.text;
                  String precio = precioController.text;
                  productos.add(
                    Producto(
                      id: int.parse(id),
                      nombre: nombre,
                      precio: double.parse(precio),
                    ),
                  );
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
