import 'package:flutter/material.dart';
import '../models/travel.dart';

class TravelsPage extends StatelessWidget {
  final List<Travel> travels;  // Lista de viagens feitas

  const TravelsPage({super.key, required this.travels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viagens Feitas'),
        backgroundColor: Colors.blue,
      ),
      body: travels.isEmpty
          ? const Center(child: Text('Nenhuma viagem concluída.'))
          : ListView.builder(
              itemCount: travels.length,
              itemBuilder: (context, index) {
                final travel = travels[index];
                return ListTile(
                  title: Text(travel.transport ?? 'Sem transporte'),
                  subtitle: Text(
                      'Data: ${travel.date.day}/${travel.date.month}/${travel.date.year}\n'
                      'Destino: ${travel.destination}'),
                );
              },
            ),
    );
  }
}
