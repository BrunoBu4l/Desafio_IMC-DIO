import 'package:calculadora_imc/model/imc.dart';
import 'package:calculadora_imc/pages/lista.dart';
import 'package:calculadora_imc/repository/imc_repository.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  String massa = "";
  IMCRepository imcRepository = IMCRepository();
  IMC? imc;
  List<IMC> ultimasConsultas = [];

  Future<void> _reloadList() async {
    await Future.delayed(const Duration(seconds: 0), () {
      imc = IMC(double.parse(pesoController.text),
          double.parse(alturaController.text), "");

      var newList = imcRepository.calcular(imc!);

      setState(() {
        ultimasConsultas = newList;
        massa = ultimasConsultas[ultimasConsultas.length - 1].classificacao;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Calculadora IMC",
        )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: ListView(children: [
            Column(children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: const Text("Calcule seu índice de massa corporal ")),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 8),
                        child: const Text("Peso"),
                      ),
                      TextField(controller: pesoController),
                    ],
                  )),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        alignment: Alignment.center,
                        child: const Text("Altura"),
                      ),
                      TextField(controller: alturaController),
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 50,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () async {
                    await _reloadList();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Sua massa corporal é $massa'),
                    ));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((_) =>
                                Lista(ultimasConsultas: ultimasConsultas))));
                  },
                  child: const Text(
                    "Calcular",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              // const SizedBox(height: 20),
              // Visibility(
              //     visible: ultimasConsultas.isNotEmpty,
              //     replacement: const Center(
              //       child: Text('Não tem nada.'),
              //     ),
              //     child: RefreshIndicator(
              //       onRefresh: _reloadList,
              //       child: ListView.separated(
              //         itemBuilder: (BuildContext context, int index) {
              //           print(ultimasConsultas[index].altura);
              //           return ListTile(
              //             leading:
              //                 Text(ultimasConsultas[index].altura.toString()),
              //             title: Text(ultimasConsultas[index].peso.toString()),
              //             trailing: Text(ultimasConsultas[index].classificacao),
              //           );
              //         },
              //         padding: const EdgeInsets.all(16),
              //         separatorBuilder: (_, __) => const Divider(),
              //         itemCount: ultimasConsultas.length,
              //       ),
              //     ))
            ]),
          ]),
        ),
      ),
    );
  }
}
