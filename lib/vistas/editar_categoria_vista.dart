import 'package:clasetopicosuno/controladores/editar_categoria_controller.dart';
import 'package:flutter/material.dart';

class EditarCategoria extends StatelessWidget {
  final String categoria;
  final int index;
  final TextEditingController controlador = TextEditingController();
  final EditarCategoriaController editarCategoriaController =
      EditarCategoriaController();
  EditarCategoria({
    Key? key,
    required this.categoria,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controlador.text = categoria;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Categoría'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('Nombre de categoría'),
            TextField(
              controller: controlador,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await editarCategoriaController.editarCategoria(
                  controlador.text,
                  index,
                );
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
