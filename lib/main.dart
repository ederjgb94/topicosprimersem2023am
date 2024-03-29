import 'package:clasetopicosuno/vistas/menu_vista.dart';
import 'package:clasetopicosuno/vistas/ventas_vista.dart';
import 'package:clasetopicosuno/vistas/vista_prueba.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('productos');
  Hive.openBox('categorias');
  // await box.clear();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuVista(),
    );
  }
}
