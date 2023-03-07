import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:clasetopicosuno/producto.dart';
import 'package:clasetopicosuno/vistas/crear_producto.dart';
import 'package:clasetopicosuno/vistas/ver_productos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());

  await Hive.initFlutter();

  Hive.registerAdapter(ProductoAdapter());

  // List<Map<String, dynamic>> productos = [
  //   {
  //     'id': 1,
  //     'codigo': '34402304',
  //     'nombre': 'Coca',
  //     'precio': 18,
  //   },
  //   {
  //     'id': 2,
  //     'codigo': '454544',
  //     'nombre': 'Pepsi',
  //     'precio': 19,
  //   }
  // ];
  // box.put('productos', productos);
  // List<dynamic> info = box.get('productos');
  // var suma = info[1]['precio'] + info[0]['precio'];
  // print(suma);

  //*** */
  //Probando Clases en Hive
  //** */

  var box = await Hive.openBox('productos');

  //les paso el random para generar productos
  //tipo aleatorios para apreciar mejor el ADD
  var random = Random();

  var nombres_productos = [
    'Coca Cola',
    'Pepsi',
    'Fanta',
    'Sprite',
    'Manzana Verde',
    'Manzana Roja',
    'Manzana Amarilla',
    'Manzana Blanca',
    'Manzana Negra',
  ];
  Producto nuevo_producto = Producto(
    codigo: (random.nextInt(99999) + 10000).toString(),
    nombre: nombres_productos[random.nextInt(nombres_productos.length)],
    precio: random.nextDouble() * 200 + 10,
  );

  // box.add(nuevo_producto); //AÑADE UN PRODUCTO

  print(box.values.length);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.title = '',
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController codigoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  bool errorNombre = false;
  List<Producto> productos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text(widget.title),
        toolbarHeight: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal.shade300,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CrearProducto();
                  },
                ),
              ).then(
                (value) {
                  // String codigo = value['codigo'];
                  // String nombre = value['nombre'];
                  // double precio = double.parse(value['precio']);

                  if (value != null) {
                    //productos.add(value); //ESTO TENIAMOS ANTES

                    /** ESTO ES CON HIVE */
                    /** OJO!!! 
                     *  VEAN EL MAIN
                     *   AHÍ YA ABRÍ CON OPENBOX ('PRODUCTOS')
                     *  POR ESO PUEDO USAR HIVE.BOX PORQUE YA ESTA ABIERTO
                     *  SI HACEMOS BOX.CLOSE EN ALGUNA PARTE
                     *  LA CAJA SE CIERRA Y DARA ERROR LO DE ABAJO
                     *  POR LO TANTO ANTES DE USAR HIVE.BOX
                     *  TENEMOS QUE ABRIR LA CAJA CON OPENBOX :)!
                     */
                    var producto = value;
                    var box = Hive.box('productos');
                    box.add(producto);

                    print(box.values);
                  }
                },
              );
            },
            child: Text('Crear Producto'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink.shade300,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return VerProductos(
                      productos: productos,
                    );
                  },
                ),
              );
            },
            child: Text('Ver Productos'),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/imagen.png'),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

//    () => null
algo() {
  return 4 + 5;
}
