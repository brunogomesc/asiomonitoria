import 'package:flutter/foundation.dart';

class Historic {
  final String id;
  final String idCliente;
  final String placa;
  final String status;
  final String dataAcesso;

  Historic({
    @required this.id,
    @required this.idCliente,
    @required this.placa,
    @required this.status,
    @required this.dataAcesso,
  });
}
