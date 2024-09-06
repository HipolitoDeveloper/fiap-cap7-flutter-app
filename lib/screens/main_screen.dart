import 'package:flutter/material.dart';
import '../models/travel.dart';
import 'home_page.dart';
import 'travels_page.dart';
import 'confirm_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Travel> travels = [];  // Lista de viagens criadas (não concluídas)
  final List<Travel> completedTravels = [];  // Lista de viagens feitas (concluídas)
  String userName = 'Gabriel';
  Travel? currentTravel;

  // Função para mudar a aba selecionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Função para adicionar uma viagem e ir para a aba de confirmação
  void _addTravel(BuildContext context, Travel travel) {
    setState(() {
      travels.add(travel);
      currentTravel = travel;
      _selectedIndex = 2; // Vai diretamente para a aba de confirmação
    });

    // Navega de volta para a MainScreen e seleciona a aba 2 (ConfirmPage)
    Navigator.of(context).popUntil((route) => route.isFirst);  // Remove todas as telas da pilha até a MainScreen
  }

  // Função para finalizar a viagem atual e movê-la para a lista de viagens concluídas
  void _completeTravel() {
    if (currentTravel != null) {
      setState(() {
        completedTravels.add(currentTravel!);  // Adiciona a viagem à lista de viagens concluídas
        travels.remove(currentTravel);  // Remove a viagem atual da lista de viagens em andamento
        currentTravel = null;  // Reseta a viagem atual
        _selectedIndex = 0;  // Volta para a aba Home
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(
            onCreateTravel: _addTravel,
            userName: userName,
            currentTravel: currentTravel,  // Passa a viagem atual para bloquear o input
          ),
          TravelsPage(travels: completedTravels),  // Exibe as viagens feitas na TravelsPage
          currentTravel != null
              ? ConfirmPage(
                  travel: currentTravel!,
                  onCancelTrip: _completeTravel,  // Quando a viagem for completada, move para a lista de feitas
                )
              : const Center(child: Text('Nenhuma viagem em andamento')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus), label: 'Viagens'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Confirmar'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
