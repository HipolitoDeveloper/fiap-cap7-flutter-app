import 'package:flutter/material.dart';

import '../models/travel.dart';

class TransportDetailPage extends StatefulWidget {
  final String transportName;
  final Function(Travel) onCreateTravel;

  const TransportDetailPage({
    super.key,
    required this.transportName,
    required this.onCreateTravel,
  });

  @override
  State<TransportDetailPage> createState() => _TransportDetailPageState();
}

class _TransportDetailPageState extends State<TransportDetailPage> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController(text: '');
  final TextEditingController departureTimeController = TextEditingController(text: '');
  final TextEditingController returnTimeController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transportName),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.transportName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: 'Descrição...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Dia',
                hintText: '14/07/2024',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: departureTimeController,
                    decoration: const InputDecoration(
                      labelText: 'Ida',
                      hintText: '10:00',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: returnTimeController,
                    decoration: const InputDecoration(
                      labelText: 'Volta',
                      hintText: '17:00',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final travel = Travel(
                    transportName: widget.transportName,
                    description: descriptionController.text,
                    date: dateController.text,
                    departureTime: departureTimeController.text,
                    returnTime: returnTimeController.text,
                  );
                  widget.onCreateTravel(travel);
                  Navigator.pop(context); // Volta para a página anterior
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16.0),
                ),
                child: const Text(
                  'CRIAR',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
