import 'package:clasetopicosuno/modelos/producto_model.dart';
import 'package:clasetopicosuno/vistas/agregar_producto_vista.dart';
import 'package:clasetopicosuno/vistas/ventas_vista.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MenuVista extends StatelessWidget {
  MenuVista({Key? key}) : super(key: key);

  final List<Producto> productos = [
    Producto(id: 1, nombre: 'Coca', precio: 87.65),
    Producto(id: 2, nombre: 'Pepsi', precio: 67.65),
    Producto(id: 3, nombre: 'Fanta', precio: 57.65),
  ];

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
                  var box = Hive.box('personas');
                  List<Producto> productos = [
                    Producto(id: 1, nombre: 'Coca', precio: 87.65),
                    Producto(id: 2, nombre: 'Pepsi', precio: 67.65),
                    Producto(id: 3, nombre: 'Fanta', precio: 57.65),
                  ];

                  box.put(
                    'personas',
                    productos.map((producto) => producto.toMap()).toList(),
                  );
                  print(box.toMap());
                },
                child: const Text('Test Hive'),
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
