import 'package:flutter/material.dart';

import '../models/travel.dart';
import '../widgets/transport_button.dart';
import 'transport_detail_page.dart';

class HomePage extends StatelessWidget {
  final Function(Travel) onCreateTravel;

  const HomePage({super.key, required this.onCreateTravel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transporter'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Encontre sua viagem',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Meios de transporte disponíveis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  TransportButton(label: 'Ônibus', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransportDetailPage(
                          transportName: 'Ônibus',
                          onCreateTravel: onCreateTravel,
                        ),
                      ),
                    );
                  }),
                  TransportButton(label: 'Trem', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransportDetailPage(
                          transportName: 'Trem',
                          onCreateTravel: onCreateTravel,
                        ),
                      ),
                    );
                  }),
                  TransportButton(label: 'Metro', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransportDetailPage(
                          transportName: 'Metro',
                          onCreateTravel: onCreateTravel,
                        ),
                      ),
                    );
                  }),
                  TransportButton(label: 'Uber', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransportDetailPage(
                          transportName: 'Uber',
                          onCreateTravel: onCreateTravel,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
