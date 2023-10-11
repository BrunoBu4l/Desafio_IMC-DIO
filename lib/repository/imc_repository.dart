import 'dart:math';

import 'package:calculadora_imc/model/imc.dart';

class IMCRepository {
  double result = 0;
  // Map<String, IMC> ultimosCinco = {};
  List<IMC> lista = [];

  List<IMC> calcular(IMC imc) {
    result = imc.getPeso() / pow(imc.getAltura(), 2);

    // ultimosCinco.update("", (value) => imc, ifAbsent: () => imc);
    if (result < 16) {
      // ultimosCinco.update("Magreza grave", (value) => imc, ifAbsent: () => imc);

      imc.setClassificacao("Magreza grave");
      lista.add(imc);
      List<IMC> listaReversa = List.from(lista.reversed);
      return listaReversa;
    }
    if (result < 17) {
      // ultimosCinco.update("Magreza moderada", (value) => imc, ifAbsent: () => imc);

      imc.setClassificacao("Magreza moderada");
      lista.add(imc);
      List<IMC> listaReversa = List.from(lista.reversed);
      return listaReversa;
    }
    if (result < 18.5) {
      // ultimosCinco.update("Magreza leve", (value) =>

      imc.setClassificacao("Magreza leve");
      lista.add(imc);
      List<IMC> listaReversa = List.from(lista.reversed);
      return listaReversa;
    }
    if (result < 25) {
      // ultimosCinco.update("Saudável", (value) => imc, ifAbsent: () => imc);

      imc.setClassificacao("Saudável");
      lista.add(imc);
      List<IMC> listaReversa = List.from(lista.reversed);
      return listaReversa;
    }
    if (result < 30) {
      // ultimosCinco.update("Sobrepeso", (value) => imc, ifAbsent: () => imc);

      imc.setClassificacao("Sobrepeso");
      lista.add(imc);
      List<IMC> listaReversa = List.from(lista.reversed);
      return listaReversa;
    }
    if (result < 35) {
      // ultimosCinco.update("Obesidade Grau I", (value) => imc, ifAbsent: () => imc);

      imc.setClassificacao("Obesidade Grau I");
      lista.add(imc);
      List<IMC> listaReversa = List.from(lista.reversed);
      return listaReversa;
    }
    if (result < 40) {
      // ultimosCinco.update("Obesidade Grau II (servera)", (value) => imc, ifAbsent: () => imc);

      imc.setClassificacao("Obesidade Grau II (servera)");
      lista.add(imc);
      List<IMC> listaReversa = List.from(lista.reversed);
      return listaReversa;
    }
    // ultimosCinco.update("Obesidade Grau III (mórbida)", (value) => imc, ifAbsent: () => imc);

    imc.setClassificacao("Obesidade Grau III (mórbida)");
    lista.add(imc);
    List<IMC> listaReversa = List.from(lista.reversed);
    return listaReversa;
  }
}
