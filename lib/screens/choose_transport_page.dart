import 'package:flutter/material.dart';
import '../models/travel.dart';

class ChooseTransportPage extends StatefulWidget {
  final Travel travel;
  final Function onCreateTravel;

  const ChooseTransportPage({
    super.key,
    required this.travel,
    required this.onCreateTravel,
  });

  @override
  _ChooseTransportPageState createState() => _ChooseTransportPageState();
}

class _ChooseTransportPageState extends State<ChooseTransportPage> {
  int selectedOptionIndex = 0;

  final List<Map<String, String>> transportOptions = [
    {'name': 'Ônibus', 'details': 'Rua das neves, 113', 'price': 'R\$4,90', 'time': '45 min'},
    {'name': 'Ônibus -> Trem', 'details': 'Rua das neves, 113', 'price': 'R\$4,90', 'time': '35 min'},
    {'name': 'Ônibus -> Trem -> Ônibus', 'details': 'Rua das neves, 113', 'price': 'R\$4,90', 'time': '55 min'},
  ];

  final List<String> transportDescriptions = [
    '''
    Ande 5 minutos da sua localização atual para o ponto de onibus na Rua das Neves, 113.
    O onibus de número 335 te levará ao local desejado em 45 minutos.
    O valor da tarifa será de 4,90.
    ''',
    '''
    Ande 5 minutos da sua localização atual para o ponto de onibus na Rua das Neves, 113.
    O onibus de número 335 te levará à estação Paraíso.
    Na estação Paraíso, siga sentido Sul para a estação Mariana.
    Desça na estação Mariana e ande 10 minutos até o seu destino.
    O valor da tarifa será de Ônibus + Metrô é de 4,90.
    ''',
    '''
    Ande 5 minutos da sua localização atual para o ponto de onibus na Rua das Neves, 113.
    O onibus de número 335 te levará à estação Paraíso.
    Na estação Paraíso, siga sentido Sul para a estação Mariana.
    Desça na estação Mariana e pegue o ônibus 223 para o seu destino.
    O valor da tarifa será de Ônibus + Trem + Ônibus é de 4,90.
    ''',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolha um transporte')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Exibe a descrição do transporte selecionado
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Caminho',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  transportDescriptions[selectedOptionIndex],  // Exibe a descrição como String
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Lista de opções de transporte
            Expanded(
              child: ListView.builder(
                itemCount: transportOptions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOptionIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedOptionIndex == index ? Colors.blue.shade100 : Colors.grey.shade200,
                        border: Border.all(
                          color: selectedOptionIndex == index ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transportOptions[index]['name']!),
                          const SizedBox(height: 8),
                          Text('Detalhes: ${transportOptions[index]['details']}'),
                          const SizedBox(height: 8),
                          Text('Preço: ${transportOptions[index]['price']}'),
                          const SizedBox(height: 8),
                          Text('Tempo: ${transportOptions[index]['time']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Atualiza o transporte da viagem e passa a descrição selecionada
                widget.travel.transport = transportOptions[selectedOptionIndex]['name']!;
                widget.travel.description = transportDescriptions[selectedOptionIndex];  // Adiciona a descrição como String

                // Chama a função onCreateTravel ao completar a seleção de transporte
                widget.onCreateTravel(context, widget.travel);

                // Não precisa chamar o Navigator.pop aqui, o _addTravel na MainScreen fará a navegação
              },
              child: Text('Escolher ${transportOptions[selectedOptionIndex]['name']}'),
            ),
          ],
        ),
      ),
    );
  }
}
