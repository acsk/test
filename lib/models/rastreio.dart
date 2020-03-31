class Rastreio {
  final bool success;
  final String message;
  final String header;
  final String remetente;
  final String destinatario;
  final String comprovante;


  

  Rastreio({
    this.success,
    this.message,
    this.header,
    this.remetente,
    this.destinatario,
    this.comprovante,
   
  });

  factory Rastreio.fromJson(Map<String, dynamic> json) {
    return Rastreio(
      success: json["success"],
      message: json['message'],
      remetente: json['header']['remetente'],
      destinatario: json['header']['destinatario'],
      comprovante: json['header']['comprovante'],
   
    );
  }
}
