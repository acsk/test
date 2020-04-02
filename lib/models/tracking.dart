class Tracking {
//  final String tracking;
  final String data_hora;
  final String dominio;
  final String filial;
  final String cidade;
  final String descricao;
  final String tipo;
  final String data_hora_efetiva;
  final String nome_recebedor;
  final String nro_doc_recebedor;

  final String ocorrencia;

  Tracking({
    this.data_hora,
    this.dominio,
    this.filial,
    this.cidade,
    this.ocorrencia,
    this.descricao,
    this.tipo,
    this.data_hora_efetiva,
    this.nome_recebedor,
    this.nro_doc_recebedor,
  });

 factory Tracking.fromJson(Map<String, dynamic> json) {
    return Tracking(
      data_hora: json['data_hora'],
      dominio: json['dominio'],
      filial: json['filial'],
      cidade: json['cidade'],
      ocorrencia: json['ocorrencia'],
      descricao: json['descricao'],
      tipo: json['tipo'],
      data_hora_efetiva: json['data_hora_efetiva'],
      nome_recebedor: json['nome_recebedor'],
      nro_doc_recebedor: json['nro_doc_recebedor'],
    );
  }
  
}
