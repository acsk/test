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
      body: FutureBuilder<List<Tracking>>(
          future: fetchTracking(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              // return: show loading widget
            }
            if (snapshot.hasError) {
              // return: show error widget
            }
            List<Tracking> tracking = snapshot.data ?? [];
            return ListView.builder(
                itemCount: tracking.length,
                itemBuilder: (context, index) {
                  Tracking track = tracking[index];
                  return new Text(track.cidade);
                });
          }),
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

  Future<List<Tracking>> fetchTracking() async {
    var response = await http.post(Uri.encodeFull("$url"),
        body: json.encode({
          "cnpj": "$cnpj".replaceAll(new RegExp(r'[^\w\s]+'), ''),
          "senha": "$senha",
          "nro_nf": "$nronf",
          //"pedido": "$pedido",
        }),
        headers: {
          "content-type": "application/json",
        });

    if (response.statusCode == 200) {
      var dados = jsonDecode(response.body);

      print(response.body);
      final trackingListJson = (dados["tracking"] as List);
      final trackingListModel = List<Tracking>();

      for (var item in trackingListJson)
        trackingListModel.add(Tracking.fromJson(item));

      return trackingListModel;
    } else {
      throw Exception('Failed to load tracking');
    }
  }
}
