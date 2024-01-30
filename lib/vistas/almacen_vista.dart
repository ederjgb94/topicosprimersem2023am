import 'package:clasetopicosuno/widgets/custom_button_navigation.dart';
import 'package:flutter/material.dart';

class AlmacenVista extends StatelessWidget {
  const AlmacenVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Almacen'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: CustomButtonNavigation(
          onPressed: () {
            Navigator.pop(context);
          },
          label: 'Regresar',
        ),
      ),
    );
  }
}
