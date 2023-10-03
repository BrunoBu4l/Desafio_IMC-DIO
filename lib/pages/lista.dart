import 'package:calculadora_imc/model/imc.dart';
import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  final List<IMC> ultimasConsultas;
  const Lista({super.key, required this.ultimasConsultas});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Listagens das últimas consultas"),
        ),
        body: ListView.separated(
          itemCount: ultimasConsultas.length,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(ultimasConsultas[index].altura.toString()),
              title: Text(ultimasConsultas[index].peso.toString()),
              trailing: Text(ultimasConsultas[index].classificacao),
            );
          },
        ),
      ),
    );
  }
}
