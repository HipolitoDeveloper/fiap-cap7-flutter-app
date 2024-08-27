import 'package:flutter/material.dart';

import '../models/travel.dart';

class TravelsPage extends StatelessWidget {
  final List<Travel> travels;

  const TravelsPage({super.key, required this.travels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viagens Criadas'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: travels.length,
        itemBuilder: (context, index) {
          final travel = travels[index];
          return ListTile(
            title: Text(travel.transportName),
            subtitle: Text('${travel.date}, ${travel.departureTime} - ${travel.returnTime}'),
          );
        },
      ),
    );
  }
}
