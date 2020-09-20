import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Historic {
  final String _url =
      'https://webapiasiohistorico.azurewebsites.net/api/Historico';

  List<Historic> _historics = [];

  final String id;
  final String placa;
  final String status;
  final DateTime dataAcesso;

  Historic({
    @required this.id,
    @required this.placa,
    @required this.status,
    @required this.dataAcesso,
  });

  Future<void> loadHistoric() async {
    final response = await http.get(_url);

    Map<String, dynamic> data = json.decode(response.body);

    data.forEach((historicId, historicData) {
      _historics.add(Historic(
        id: historicId,
        placa: historicData['placa'],
        status: historicData['status'],
        dataAcesso: historicData['data_acesso'],
      ));
    });

    //notifyListener();

    print(json.decode(response.body));
  }
}
