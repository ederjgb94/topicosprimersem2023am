import 'package:clasetopicosuno/controladores/ventas_controller.dart';
import 'package:clasetopicosuno/vistas/almacen_vista.dart';
import 'package:clasetopicosuno/widgets/custom_button_navigation.dart';
import 'package:flutter/material.dart';

class VentasVista extends StatefulWidget {
  const VentasVista({super.key});

  @override
  VentasVistaState createState() => VentasVistaState();
}

class VentasVistaState extends State<VentasVista> {
  VentasController ventasController = VentasController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // children: List.generate(
          //   6,
          //   (index) => const Text('a'),
          // ),
          // children: nombreProductos.map(
          //   (String nombreProducto) {
          //     return Text(nombreProducto);
          //   },
          // ).toList(),

          // children: [
          //   for (String nombreProducto in nombreProductos)
          //     Text(nombreProducto),
          //   for (double precioProducto in precioProductos)
          //     Text(precioProducto.toString()),
          // ],

          // children: [
          //   CustomButtonNavigation(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const AlmacenVista(),
          //         ),
          //       );
          //     },
          //     label: 'Ir a Almacen',
          //   ),
          // ],

          children: [
            for (var producto in ventasController.verProductos())
              ListTile(
                title: Text(producto.nombre),
                subtitle: Text(producto.precio.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                leading: Text(
                  producto.id.toString(),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ventasController.agregarProductoAleatorio();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
