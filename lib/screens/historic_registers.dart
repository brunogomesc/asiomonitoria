import 'package:asiomonitoria/models/historic.dart';
import 'package:flutter/material.dart';

class HistoricRegister extends StatelessWidget {
  final List<Historic> historico;

  HistoricRegister({this.historico});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 700,
        child: ListView.builder(
          itemCount: historico.length,
          itemBuilder: (ctx, index) {
            return Card(
              color: Color.fromRGBO(195, 196, 200, 100),
              //linha do histórico
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      historico[index].placa,
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
                          historico[index].status,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          historico[index].dataAcesso,
                          //DateFormat('d/M/y H:m:s').format(DateTime.now()),
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
      ),
    );
  }
}
