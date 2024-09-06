import 'package:flutter/material.dart';

class Travel {
  final String destination;
  final DateTime date;
  final TimeOfDay time;
  String? transport;
  String? description;  // Agora 'description' é uma String

  Travel({
    required this.destination,
    required this.date,
    required this.time,
    this.transport,
    this.description,
  });
}


