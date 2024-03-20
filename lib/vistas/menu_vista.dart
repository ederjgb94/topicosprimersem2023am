import 'dart:typed_data';

import 'package:clasetopicosuno/modelos/producto_model.dart';
import 'package:clasetopicosuno/vistas/agregar_producto_vista.dart';
import 'package:clasetopicosuno/vistas/categorias_vista.dart';
import 'package:clasetopicosuno/vistas/crear_categoria_vista.dart';
import 'package:clasetopicosuno/vistas/ventas_vista.dart';
import 'package:clasetopicosuno/vistas/ver_imagen.dart';
import 'package:clasetopicosuno/vistas/ver_productos_vista.dart';
import 'package:clasetopicosuno/vistas/ver_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MenuVista extends StatelessWidget {
  MenuVista({Key? key}) : super(key: key);

  final List<Producto> productos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menú'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VentasVista(
                        productos: productos,
                      ),
                    ),
                  );
                },
                child: const Text('Ventas'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgregarProductoVista(
                        productos: productos,
                      ),
                    ),
                  );
                },
                child: const Text('Agregar Producto'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerProductosVista(),
                    ),
                  );
                },
                child: const Text('Ver Productos'),
              ),
              ElevatedButton(
                onPressed: () {
                  var box = Hive.box('productos');

                  print(box.toMap());
                },
                child: const Text('Test Hive'),
              ),
              ElevatedButton(
                onPressed: () async {
                  const XTypeGroup typeGroup = XTypeGroup(
                    label: 'images',
                    extensions: <String>['jpg', 'png'],
                  );
                  final XFile? file = await openFile(
                      acceptedTypeGroups: <XTypeGroup>[typeGroup]);
                  final Uint8List bytes = await file!.readAsBytes();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerImagenVista(
                        imageBytes: bytes,
                      ),
                    ),
                  );
                },
                child: const Text('Abrir archico'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CrearCategoriaVista();
                      },
                    ),
                  );
                },
                child: const Text('Crear Categoria'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CategoriasVista();
                      },
                    ),
                  );
                },
                child: const Text('Categorias'),
              ),
              ElevatedButton(
                onPressed: () {
                  var db = FirebaseFirestore.instance;
                  var faker = Faker();

                  // Create a new user with a first and last name
                  final user = <String, dynamic>{
                    "first": faker.person.firstName(),
                    "last": faker.person.lastName(),
                    "born": faker.date.year(),
                  };

// Add a new document with a generated ID
                  db.collection("users").add(user).then(
                        (DocumentReference doc) =>
                            print('DocumentSnapshot added with ID: ${doc.id}'),
                      );
                },
                child: const Text('TestFirebase'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const VerUsers();
                      },
                    ),
                  );
                },
                child: const Text('Ver Users'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // var box = Hive.box('testBox');

            // box.put('name', 'David3');

            // var name = box.get('name');

            // print('Name: $name');
          },
          child: const Icon(Icons.add),
        ));
  }
}
