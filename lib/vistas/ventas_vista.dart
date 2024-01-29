import 'package:flutter/material.dart';

class VentasVista extends StatefulWidget {
  const VentasVista({super.key});

  @override
  VentasVistaState createState() => VentasVistaState();
}

class VentasVistaState extends State<VentasVista> {
  List<String> nombreProductos = <String>[
    'Coca Cola',
    'Pepsi',
    'Fanta',
    'Sprite',
    'Manzana',
    'Naranja',
  ];

  List<double> precioProductos = <double>[
    10.0,
    11.0,
    12.0,
    13.0,
    14.0,
    15.0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: List.generate(
            //   6,
            //   (index) => const Text('a'),
            // ),
            // children: nombreProductos.map(
            //   (String nombreProducto) {
            //     return Text(nombreProducto);
            //   },
            // ).toList(),

            children: [
              for (String nombreProducto in nombreProductos)
                Text(nombreProducto),
              for (double precioProducto in precioProductos)
                Text(precioProducto.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
