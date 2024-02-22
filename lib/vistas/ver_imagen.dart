import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

class VerImagenVista extends StatelessWidget {
  final Uint8List imageBytes;
  const VerImagenVista({super.key, required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Imagen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.memory(imageBytes),
          ],
        ),
      ),
    );
  }
}
