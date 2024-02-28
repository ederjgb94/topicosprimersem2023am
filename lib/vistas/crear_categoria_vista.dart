import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CrearCategoriaVista extends StatelessWidget {
  final TextEditingController nombreCategoriaController =
      TextEditingController();
  CrearCategoriaVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Categoría'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: nombreCategoriaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre de la categoría',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var box = Hive.box('categorias');
                box.add(nombreCategoriaController.text);
                if (kDebugMode) {
                  print(box.toMap());
                }
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
