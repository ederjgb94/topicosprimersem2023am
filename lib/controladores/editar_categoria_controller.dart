import 'package:hive_flutter/hive_flutter.dart';

class EditarCategoriaController {
  Future<void> editarCategoria(categoria, index) async {
    var categorias = Hive.box('categorias');
    await categorias.putAt(index, categoria);
  }
}
