import 'dart:convert';

import 'package:flutter/material.dart';
import 'pages/rastrear.dart';


void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Luz Transportadora"),
        //   backgroundColor: Colors.lightGreen,
        // ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(30.0),
                        child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: 
                        Image.asset('assets/logo.png',height: 130,)),
                  ],
                ),
                Divider(),
               
                    SizedBox(
                       width: double.infinity,
                        height: 60,
                        child: RaisedButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RastrearMercadoria()));
                          },
                          child: Text(
                            "RASTREAR PEDIDO",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  
                Divider(),
                    SizedBox(
                       width: double.infinity,
                        height: 60,
                        child: RaisedButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RastrearMercadoria()));
                          },
                          child: Text(
                            "RASTREAR PEDIDO",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  
                Divider(),
                    SizedBox(
                       width: double.infinity,
                        height: 60,
                        child: RaisedButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RastrearMercadoria()));
                          },
                          child: Text(
                            "RASTREAR PEDIDO",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  
                Divider(),
              
              ],
            )));
  }

   
}
