//import 'dart:convert';
//import 'package:asiomonitoria/models/historic.dart';
import 'package:asiomonitoria/models/historic.dart';
import 'package:http/http.dart' as http;
import '.././main.dart' as Home;

class ValidaApi {
  var responseEntrar;
  var responseHistorico;
  List<Historic> historicoList = [];

  //List<Historic> get historic => [..._historicos];

  Future<bool> validaUser(String user, String pass) async {
    if (user == 'admin' && pass == '1234') {
      Home.MyHomePage().idCliente = 1;
      return true;
    } else if (user == 'admin2' && pass == '12345') {
      // Home.MyHomePage().idCliente = 2;
      return true;
    } else
      return false;

    // TRECHO QUE CONECTA NA API E AUTENTICA O USUÁRIO

    //var client = http.Client();
    //var urlEntrar =
    //    'https://webapiasiohistorico20201019.azurewebsites.net/api/Entrar/' +
    //        user;

    //responseEntrar = await client.read(urlEntrar);

    //try {
    //  if (responseEntrar.indexOf(user) != -1 &&
    //      responseEntrar.indexOf(pass) != -1) {
    //    return true;
    //  } else
    //    return false;
    //} catch (error) {
    //  throw new Exception(error);
    //}
  }

  Future<void> retornaHistorico(int idEntrar) async {
    //TRECHO DE CÓDIGO QUE BUSCA OS VALORES NA API

    //var client = http.Client();
    //final String _urlHistorico =
    //'https://webapiasiohistorico20201019.azurewebsites.net/api/Historico';

    //responseHistorico = await client.get(_urlHistorico);

    //historicoList = await json.decode(responseHistorico.body);

    //historicos = dados.toList();

    //_historicos = dados.forEach(
    //  (historicoId, historicoDados) {
    //    _historicos.add(
    //      Historic(
    //        id: historicoId,
    //        idCliente: historicoDados['id_entrar'] == idEntrar
    //             ? historicoDados['id_entrar']?.cast<String>()
    //             : 0,
    //        placa: historicoDados['placa']?.cast<String>(),
    //        dataAcesso: historicoDados['data_entrada']?.cast<String>(),
    //        status: historicoDados['acesso'] == true
    //            ? 'Permitido'
    //            : 'Não Permitido',
    //      ),
    //    );
    //  },
    //);

    //print('Dados: ${historicoList.toString()}');
  }
}
