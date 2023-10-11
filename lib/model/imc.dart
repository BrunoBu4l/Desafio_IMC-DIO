class IMC {
  double _peso = 0;
  double _altura = 0;
  String _classificacao = "";

  IMC(this._peso, this._altura, this._classificacao);

  void setClassificacao(String nome) {
    _classificacao = nome;
  }

  String getClassificacao() {
    return _classificacao;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  @override
  String toString() {
    return {"Peso": _peso, "Altura": _altura, "Classificação": _classificacao}
        .toString();
  }
}
