import 'package:clasetopicosuno/controladores/categorias_controller.dart';
import 'package:clasetopicosuno/vistas/crear_categoria_vista.dart';
import 'package:clasetopicosuno/vistas/editar_categoria_vista.dart';
import 'package:flutter/material.dart';

class CategoriasVista extends StatefulWidget {
  const CategoriasVista({super.key});

  @override
  State<CategoriasVista> createState() => _CategoriasVistaState();
}

class _CategoriasVistaState extends State<CategoriasVista> {
  final CategoriasController categoriasController = CategoriasController();

  @override
  Widget build(BuildContext context) {
    var categorias = categoriasController.obtenerCategorias();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorías'),
        ),
        body: Center(
          child: Column(children: [
            for (int i = 0; i < categorias.length; i++)
              ListTile(
                title: Text(categorias[i].nombre),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.teal.shade300,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditarCategoria(
                            categoria: categorias[i].nombre,
                            index: i,
                          );
                        })).whenComplete(() => setState(() {}));
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.shade300,
                      ),
                      onPressed: () {
                        categoriasController.eliminarCategoria(i);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CrearCategoriaVista(),
              ),
            ).whenComplete(() => setState(() {}));
          },
          child: const Icon(Icons.add),
        ));
  }
}
