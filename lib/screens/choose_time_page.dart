import 'package:flutter/material.dart';
import '../models/travel.dart';
import 'choose_transport_page.dart';

class ChooseTimePage extends StatefulWidget {
  final String destination;
  final Function onCreateTravel;  // Recebe onCreateTravel da HomePage

  const ChooseTimePage({
    super.key,
    required this.destination,
    required this.onCreateTravel,
  });

  @override
  _ChooseTimePageState createState() => _ChooseTimePageState();
}

class _ChooseTimePageState extends State<ChooseTimePage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) setState(() => selectedTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha um horário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Dia'),
              trailing: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
              onTap: () => _selectDate(context),
            ),
            ListTile(
              title: const Text('Hora de ida'),
              trailing: Text(selectedTime.format(context)),
              onTap: () => _selectTime(context),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Cria o objeto Travel com o destino, data e hora
                Travel newTravel = Travel(
                  destination: widget.destination,
                  date: selectedDate,
                  time: selectedTime,
                );

                // Navega para a escolha de transporte, passando a viagem e onCreateTravel
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseTransportPage(
                      travel: newTravel,
                      onCreateTravel: widget.onCreateTravel,  // Passa onCreateTravel para ChooseTransportPage
                    ),
                  ),
                );
              },
              child: const Text('Próximo'),
            ),
          ],
        ),
      ),
    );
  }
}
