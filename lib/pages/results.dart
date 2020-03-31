import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luz_transportes/models/rastreio.dart';
import 'package:luz_transportes/models/tracking.dart';

class Result extends StatelessWidget {
  final String cnpj;
  final String senha;
  final String nronf;
  final String pedido;
  final String url;

  Result({Key key, this.cnpj, this.senha, this.nronf, this.pedido, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Rastreamento'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
          child: FutureBuilder(
        future: fetchTracking(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data_header = snapshot.data;
            return Container(
                child: Text(snapshot.data,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator(
            backgroundColor: Colors.lightGreen,
          );
        },
      )),
    );
  }

  Future<Rastreio> _dados() async {
    var response = await http.post(Uri.encodeFull("$url"),
        body: json.encode({
          "cnpj": "$cnpj".replaceAll(new RegExp(r'[^\w\s]+'), ''),
          "senha": "$senha",
          "nro_nf": "$nronf",
          //"pedido": "$pedido}",
        }),
        headers: {
          "content-type": "application/json",
        });

    if (response.statusCode == 200) {
      print(response.body);
      return Rastreio.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load tracking');
    }
  }

  Future<Tracking> fetchTracking() async {
    var response = await http.post(Uri.encodeFull("$url"),
        body: json.encode({
          "cnpj": "$cnpj".replaceAll(new RegExp(r'[^\w\s]+'), ''),
          "senha": "$senha",
          "nro_nf": "$nronf",
          //"pedido": "$pedido}",
        }),
        headers: {
          "content-type": "application/json",
        });

    if (response.statusCode == 200) {
      print(response.body);
      return Tracking.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load tracking');
    }
  }
}
