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
      body: null
    );
  }
}
