import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lista_contato_checkpoint/contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ListaContatoPage(),
    );
  }
}

class ListaContatoPage extends StatefulWidget {
  const ListaContatoPage({Key? key}) : super(key: key);

  @override
  State<ListaContatoPage> createState() => _ListaContatoPageState();
}

class _ListaContatoPageState extends State<ListaContatoPage> {
  List<Contato> contatos = [
    Contato('Gabriel Baron', 'gabrielbaron@email.com'),
    Contato('Pedro Pitagoras', 'pedropitagoras@email.com'),
    Contato('Arthur Reis', 'reisarthur@email.com'),
    Contato('Josney Barros', 'josneybarros@email.com'),
    Contato('Wesley Santos', 'wesleysantos@email.com'),
    Contato('Neymar Junior', 'njrcontato@email.com'),
    Contato('Jailson Mendes', 'jailsonmendes@email.com'),
    Contato('Carlos dos Santos', 'carlossantos@email.com'),
    Contato('Marcos da Silva', 'marcossilva@email.com'),
    Contato('Messi Lionel', 'lionelmessicontato@email.com'),
    Contato('Yuri Alberto', 'yurialbertocontato@email.com'),
    Contato('Marquito do Ratinho', 'marquitoacessoria@email.com'),
  ];

  int contatosFavoritos () {
    return contatos.where((contatos) => contatos.favorito).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 185, 40),
        title: Text('Lista de Contatos ${contatosFavoritos()}'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 1}'),
              ),
              title: Text(contatos[index].nome),
              subtitle: Text(contatos[index].email),
              trailing: IconButton(
                icon: Icon(
                  contatos[index].favorito ? Icons.favorite : Icons.favorite_border,
                  color: contatos[index].favorito ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    contatos[index].favorito = !contatos[index].favorito;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
