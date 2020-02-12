import 'package:crpytinfo/home_page.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;



void main() async {
  List currencies= await getCurriencies();
  print(currencies);

  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new HomePage(_currencies),
    );
  }
}





  Future<List> getCurriencies() async{

    String cryptoUrl="https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response= await http.get(cryptoUrl);
    return json.decode(response.body);

  }


