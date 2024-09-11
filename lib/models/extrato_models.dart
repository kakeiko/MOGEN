class ExtratoModel {
  String? nome;
  String? valor;
  String? dia;
  int? ganhoGasto;

  ExtratoModel({this.nome, this.valor, this.dia, this.ganhoGasto});

  ExtratoModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    valor = json['valor'];
    dia = json['dia'];
    ganhoGasto = json['ganho_gasto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['valor'] = this.valor;
    data['dia'] = this.dia;
    data['ganho_gasto'] = this.ganhoGasto;
    return data;
  }
}