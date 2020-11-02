import 'package:asiomonitoria/models/historic.dart';
import 'package:asiomonitoria/models/historic_model.dart';
import 'package:flutter/material.dart';
import '../main.dart' as Home;
import 'historic_registers.dart';
//import 'package:intl/intl.dart';
//import '../data/API.dart' as api;

String textoButton = 'Todas os status';
int valorStatus = 1;

class HistoricList extends StatefulWidget {
  //builda a tela de histórico
  @override
  _HistoricListState createState() => _HistoricListState();
}

enum Status {
  TodosStatus,
  Permitido,
  Negado,
}

List<Historic> histo = [];

class _HistoricListState extends State<HistoricList> {
  void validaHistorico() {
    print('entrou');
    if (Home.MyHomePage().idCliente == 1) {
      setState(() {
        List<Historic> listTemp = historicModel
            .where((cliente) => cliente.idCliente.contains("1"))
            .toList();
        histo = listTemp;
      });
    } else if (Home.MyHomePage().idCliente == 2) {
      //print('entrou 2');
      setState(() {
        List<Historic> listTemp = historicModel
            .where((cliente) => cliente.idCliente.contains("2"))
            .toList();
        histo = listTemp;
        print(histo.toString());
      });
    }
  }

  List<Historic> historicoFinais = histo;
  void validaOpcaoSelecionada(int opcao) {
    if (opcao == 1) {
      historicoFinais = histo;
    } else if (opcao == 2) {
      List<Historic> listTemp =
          histo.where((status) => status.status.contains('Permitido')).toList();
      historicoFinais = listTemp;
    } else if (opcao == 3) {
      List<Historic> listTemp =
          histo.where((status) => status.status.contains('Negado')).toList();
      historicoFinais = listTemp;
    }
  }

  Future<void> _listarClassificacao() async {
    switch (await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Status dos veículos',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => {
                Navigator.pop(context, Status.TodosStatus),
              },
              child: Text(
                'Todos os status',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => {
                Navigator.pop(context, Status.Permitido),
              },
              child: Text(
                'Permitido',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => {
                Navigator.pop(context, Status.Negado),
              },
              child: Text(
                'Negado',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    )) {
      case Status.TodosStatus:
        setState(() {
          textoButton = 'Todos os status';
          valorStatus = 1;
          validaOpcaoSelecionada(valorStatus);
        });
        break;

      case Status.Permitido:
        setState(() {
          textoButton = 'Permitido';
          valorStatus = 2;
          validaOpcaoSelecionada(valorStatus);
        });
        break;

      case Status.Negado:
        setState(() {
          textoButton = 'Negado';
          valorStatus = 3;
          validaOpcaoSelecionada(valorStatus);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    validaHistorico();
    validaOpcaoSelecionada(valorStatus);
    List<Historic> historicos = historicoFinais;
    print('Buildando a tela');
    return Scaffold(
      //captura a cor padrão do Theme definido na classe principal
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Asio Monitoramento'),
      ),
      //lista dinâmica que irá renderizar somente a quantidade possivel de se exibir na tela
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 20, 120, 10),
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                color: Color.fromRGBO(158, 235, 226, 100),
                onPressed: () => {_listarClassificacao()},
                child: Text(textoButton),
              ),
            ),
            Container(
              child: HistoricRegister(
                historico: historicos,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
