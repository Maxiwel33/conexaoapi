import 'package:conexaoapi/cliente.dart';
import 'package:conexaoapi/login.dart';
import 'package:conexaoapi/produtos_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  SizedBox _body(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 15.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttons(context),
              ],
            ),
          )
        ]),
      ),
    );
  }

  _buttons(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, "Produtos",
                () => _onClickNavigator(context, const ProdutosPage())),
            _button(context, "Clientes",
                () => _onClickNavigator(context, const Clientes())),
            _button(context, "Admin",
                () => _onClickNavigator(context, const Login())),
          ],
        ),
      ],
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}

_button(BuildContext context, String text, Function() onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(text),
  );
}
