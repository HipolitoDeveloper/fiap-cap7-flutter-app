import 'package:flutter/material.dart';
import 'package:HubMaaS/models/travel.dart';  // Importa o modelo Travel
import 'choose_time_page.dart';

class HomePage extends StatefulWidget {
  final Function onCreateTravel;
  final String userName;
  final Travel? currentTravel;  // Adicionado para controlar o estado da viagem atual

  const HomePage({
    super.key,
    required this.onCreateTravel,
    required this.userName,
    required this.currentTravel,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isInputDisabled = widget.currentTravel != null;  // Bloqueia o input se houver uma viagem ativa

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(widget.userName[0].toUpperCase()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Seja bem-vindo, ${widget.userName}!',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Mostra a mensagem de aviso se houver uma viagem em andamento
            if (isInputDisabled)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Você já possui uma viagem em andamento.',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            TextField(
              controller: destinationController,
              enabled: !isInputDisabled,  // Desabilita o input se houver viagem ativa
              decoration: const InputDecoration(
                labelText: 'Para onde você vai?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isInputDisabled
                  ? null
                  : () {
                      if (destinationController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseTimePage(
                              destination: destinationController.text,
                              onCreateTravel: widget.onCreateTravel,
                            ),
                          ),
                        );
                      }
                    },
              child: const Text('Próximo'),
            ),
          ],
        ),
      ),
    );
  }
}
