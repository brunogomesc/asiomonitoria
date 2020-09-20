import 'package:asiomonitoria/models/historic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoricList extends StatefulWidget {
  //builda a tela de histórico
  @override
  _HistoricListState createState() => _HistoricListState();
}

class _HistoricListState extends State<HistoricList> {
  @override
  void initState() {
    super.initState();
    //carregando o histórico
    Provider.of<Historic>(context, listen: false).loadHistoric();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //captura a cor padrão do Theme definido na classe principal
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Asio Monitoramento'),
      ),
      //lista dinâmica que irá renderizar somente a quantidade possivel de se exibir na tela
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          //final his = historic[index];
          return Card(
            color: Color.fromRGBO(195, 196, 200, 100),
            //linha do histórico
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //informação da placa
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 15, 15),
                  //quadrado ao redor da placa
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(244, 244, 244, 100),
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  //informação dentro do quadrado
                  child: Text(
                    'Placa: ABC1234',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                //demais informações
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 60, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Não Permitido',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('d/M/y H:m:s').format(DateTime.now()),
                        style: TextStyle(
                          color: Color.fromRGBO(248, 248, 246, 100),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
