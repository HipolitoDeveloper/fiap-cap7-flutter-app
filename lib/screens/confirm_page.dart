import 'package:flutter/material.dart';
import '../models/travel.dart';

class ConfirmPage extends StatelessWidget {
  final Travel travel;
  final VoidCallback onCancelTrip;

  const ConfirmPage({
    super.key,
    required this.travel,
    required this.onCancelTrip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmação de Viagem')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Destino: ${travel.destination}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Data: ${travel.date.day}/${travel.date.month}/${travel.date.year}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Hora: ${travel.time.format(context)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Transporte: ${travel.transport}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            // Exibe a descrição completa da viagem como String
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                travel.description ?? '',  // Exibe a descrição do transporte como String
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onCancelTrip,
              child: const Text('Cancelar Viagem'),
            ),
          ],
        ),
      ),
    );
  }
}
