import 'package:clasetopicosuno/producto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrearProducto extends StatefulWidget {
  CrearProducto({super.key});

  @override
  State<CrearProducto> createState() => _CrearProductoState();
}

class _CrearProductoState extends State<CrearProducto> {
  final TextEditingController codigoController = TextEditingController();

  final TextEditingController nombreController = TextEditingController();

  final TextEditingController precioController = TextEditingController();

  bool _error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Productos',
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade800,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          TextField(
            controller: codigoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Código',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: nombreController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
              errorText: _error ? 'tu texto esta mal' : null,
            ),
            onChanged: (value) {
              setState(() {
                if (value.contains('s'))
                  _error = true;
                else
                  _error = false;
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: precioController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Precio',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                Producto(codigo: 'Ab', nombre: 'nombre', precio: 4.5),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            child: const Text('Guardar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}
