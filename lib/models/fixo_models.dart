class FixoModel {
  String? nome;
  String? categoria;
  String? valor;
  String? pagamento;
  String? banco;
  String? diaPagamento;
  int? dono;
  int? id;

  FixoModel(
      {this.nome,
      this.categoria,
      this.valor,
      this.pagamento,
      this.banco,
      this.diaPagamento,
      this.dono,
      this.id});

  FixoModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    categoria = json['categoria'];
    valor = json['valor'];
    pagamento = json['pagamento'];
    banco = json['banco'];
    diaPagamento = json['dia_pagamento'];
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
    data['dia_pagamento'] = this.diaPagamento;
    data['dono'] = this.dono;
    data['id'] = this.id;
    return data;
  }
}