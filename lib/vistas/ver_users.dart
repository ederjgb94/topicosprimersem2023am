import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class VerUsers extends StatelessWidget {
  const VerUsers({super.key});

  Future<QuerySnapshot<Map<String, dynamic>>> verUsuarios() {
    var db = FirebaseFirestore.instance;
    return db.collection('users').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      body: FutureBuilder(
        future: verUsuarios(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var usuarios = snapshot.data?.docs;
              return ListView.builder(
                itemCount: usuarios?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(usuarios?[index]['first']),
                    subtitle: Text(usuarios?[index]['last']),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error al obtener los usuarios'),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
