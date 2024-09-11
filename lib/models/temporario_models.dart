class TemporarioModel {
  String? nome;
  String? categoria;
  String? valor;
  String? pagamento;
  String? banco;
  String? diaInicial;
  String? diaFinal;
  int? dono;
  int? id;

  TemporarioModel(
      {this.nome,
      this.categoria,
      this.valor,
      this.pagamento,
      this.banco,
      this.diaInicial,
      this.diaFinal,
      this.dono,
      this.id});

  TemporarioModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    categoria = json['categoria'];
    valor = json['valor'];
    pagamento = json['pagamento'];
    banco = json['banco'];
    diaInicial = json['dia_inicial'];
    diaFinal = json['dia_final'];
    dono = json['dono'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['categoria'] = this.categoria;
    data['valor'] = this.valor;
    data['pagamento'] = this.pagamento;
    data['banco'] = this.banco;
    data['dia_inicial'] = this.diaInicial;
    data['dia_final'] = this.diaFinal;
    data['dono'] = this.dono;
    data['id'] = this.id;
    return data;
  }
}