import 'package:flutter/material.dart';
import 'screens/historic_screen.dart';
import './data/API.dart' as api;

main() => runApp(AppAsio());

//classe inicial
class AppAsio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.grey,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final userController = TextEditingController();
  final passController = TextEditingController();
  int idCliente = 1;

  //função para chamar a tela de histórico

  void _selectedPage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return HistoricList();
        },
      ),
    );
  }

  //iniciando a buildar a tela
  @override
  Widget build(BuildContext context) {
    //classe que ficará a validação de autenticação
    _autenthicateUser(String user, String pass) async {
      var autenticate = await api.ValidaApi().validaUser(user, pass);
      if (autenticate) {
        print('User autenticate..........');
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text(
                'Usuário autenticado',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
        userController.text = '';
        passController.text = '';
        await api.ValidaApi().retornaHistorico(idCliente);
        _selectedPage(context);
      } else if (user.isEmpty && pass.isEmpty) {
        print('Fields is empty..........');
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text(
                'Campos vazios',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
        userController.text = '';
        passController.text = '';
      } else {
        print('User no autenticate..........');
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text(
                'Usuário não autenticado',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
        userController.text = '';
        passController.text = '';
      }
    }

    //componente de tela que permite ter um corpo e barra de titulo
    return Scaffold(
      // cor do fundo da tela de login
      backgroundColor: Color.fromRGBO(87, 89, 101, 1.0),
      appBar: AppBar(
        title: Text('Asio Monitoramento'),
        backgroundColor: Color.fromRGBO(147, 148, 152, 100), //cor do app bar
      ),
      //corpo da tela
      //scroll impede que de overflow dos componentes com o teclado
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Image.asset('assets/images/AsioLogo.jpeg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 50),
              child: Card(
                elevation: 5,
                color: Color.fromRGBO(195, 196, 200, 100), // cor dos campos
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        //campo de login
                        child: TextField(
                          controller: userController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: 'Login',
                          ),
                        ),
                      ),
                      Container(
                        //campo de senha
                        child: TextField(
                          obscureText: true, //oculta os caracteres
                          controller: passController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: Container(
                color: Color.fromRGBO(248, 248, 246, 100),
                child: FlatButton(
                  child: Text('Acessar'),
                  textColor: Colors.white,
                  onPressed: () => {
                    _autenthicateUser(
                      userController.text,
                      passController.text,
                    )
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
