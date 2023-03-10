import 'dart:convert';

import 'package:conexaoapi/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  Future<List> pegaUsuarios() async {
    var url = Uri.parse("http://192.168.1.12/conexao/GetProd.php");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Login()));
            },
            icon: const Icon(Icons.first_page),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc_outlined),
          ),
        ],
        title: const Text('Page Itamar -'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cancel),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.update),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: pegaUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('erro ao carregar os produtosd'),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var usuarios = (snapshot.data![index]);
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                    title: Text(usuarios['descricao']),
                    subtitle: Text(usuarios['preco']),
                    trailing: Text(usuarios['quant']),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
