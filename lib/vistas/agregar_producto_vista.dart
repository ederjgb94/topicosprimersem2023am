import 'package:clasetopicosuno/controladores/agregar_producto_controller.dart';
import 'package:clasetopicosuno/modelos/categoria_model.dart';
import 'package:clasetopicosuno/modelos/producto_model.dart';
import 'package:flutter/material.dart';

class AgregarProductoVista extends StatefulWidget {
  final List<Producto> productos;

  const AgregarProductoVista({super.key, required this.productos});

  @override
  State<AgregarProductoVista> createState() => _AgregarProductoVistaState();
}

class _AgregarProductoVistaState extends State<AgregarProductoVista> {
  final AgregarProductoController controller = AgregarProductoController();

  final TextEditingController idController = TextEditingController();

  final TextEditingController nombreController = TextEditingController();

  final TextEditingController precioController = TextEditingController();

  late String currentValue;

  List<Categoria> categorias = [];

  @override
  void initState() {
    // TODO: implement initState
    categorias = controller.obtenerCategorias();
    currentValue = categorias[0].nombre;
    super.initState();
  }

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
            DropdownButton(
              value: currentValue,
              items: categorias
                  .map(
                    (categoria) => DropdownMenuItem(
                      value: categoria.nombre,
                      child: Text(categoria.nombre),
                    ),
                  )
                  .toList(),
              onChanged: (categoria) {
                currentValue = categoria.toString();
                setState(() {});
              },
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
                  controller.agregarProducto(id, nombre, precio);
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
