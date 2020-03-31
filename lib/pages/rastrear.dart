import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luz_transportes/pages/results.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MaterialApp(
    home: RastrearMercadoria(),
    theme: ThemeData(
        hintColor: Colors.lightGreenAccent,
        primaryColor: Colors.lightGreen,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen),
        )))));

class RastrearMercadoria extends StatefulWidget {
  RastrearMercadoria({Key key}) : super(key: key);

  @override
  _RastrearMercadoriaState createState() => _RastrearMercadoriaState();
}

class _RastrearMercadoriaState extends State<RastrearMercadoria> {
  TextEditingController _cnpj =
      new MaskedTextController(mask: '00.000.000/0000-00');
  TextEditingController _senha = TextEditingController();
  TextEditingController _nf = TextEditingController();


  GlobalKey<FormState> _Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rastrear Pedido'),
          backgroundColor: Colors.lightGreen,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _Formkey,
            child: Column(
              children: <Widget>[
                Divider(),
                TextFormField(
                  controller: _cnpj,
                  validator: (value) {
                    // Validar CNPJ
                    if (value.length < 14) {
                      return ("Digite até 14 caracteres.");
                    }
                    if (value.isEmpty) {
                      return ("Digite um CNPJ é válido.");
                    }
                    if (!CNPJ.isValid(value)) {
                      return ("Este CNPJ é inválido.");
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CPF/CNPJ Remetente',
                    labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.lightGreen)),
                  ),
                ),
                Divider(),
                TextFormField(
                  controller: _senha,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira uma senha";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha:',
                    labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.lightGreen)),
                  ),
                ),
                Divider(),
                TextFormField(
                  controller: _nf,
                  //obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira uma Nota Fiscal";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nota Fiscal:',
                    labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.lightGreen)),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: RaisedButton(
                    onPressed: () {
                      if (_Formkey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Result(
                                    cnpj: _cnpj.value.text,
                                    senha: _senha.value.text,
                                    nronf: _nf.value.text,
                                    url: 'https://ssw.inf.br/api/tracking')));
                      }
                    },
                    color: Colors.lightGreen,
                    child: Text(
                      'Rastrear',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<String> _tracking() async {
    String url = 'https://ssw.inf.br/api/tracking';
    var response = await http.post(Uri.encodeFull(url),
        body: json.encode({
          "cnpj": "999999999999",
          "senha": "xxxxxxx",
          "nro_nf": "88888888888",
          "pedido": "88888888888",
        }),
        headers: {
          "content-type": "application/json",
        });
    print(json.decode(response.body)['success']);
  }

  void sendData() {
    print('teste');
  }
}
