# Hub MaaS

**Hub MaaS** é um aplicativo de viagens desenvolvido com Flutter, que permite ao usuário criar e gerenciar viagens, selecionar diferentes opções de transporte, confirmar a viagem e visualizar um histórico de viagens concluídas.

## Funcionalidades

- **Criação de Viagens**: O usuário pode inserir o destino e escolher o meio de transporte preferido.
- **Confirmação de Viagens**: Após criar a viagem, o usuário pode confirmar e visualizar os detalhes.
- **Finalização de Viagens**: Uma vez concluída, a viagem pode ser marcada como finalizada.
- **Histórico de Viagens**: Exibe todas as viagens que o usuário concluiu.

## Estrutura do Aplicativo

### 1. **Página Inicial (HomePage)**

Na **HomePage**, o usuário pode inserir o destino da sua viagem. Se o usuário já tiver uma viagem em andamento, o campo de entrada de destino ficará bloqueado até que a viagem atual seja concluída.

### 2. **Escolha do Transporte (ChooseTransportPage)**

O usuário pode selecionar entre diferentes opções de transporte. Cada opção possui um detalhamento sobre o trajeto, o tempo estimado e o custo. Após a seleção, o usuário é redirecionado para a página de confirmação.

### 3. **Confirmação de Viagem (ConfirmPage)**

Na página de confirmação, o usuário pode revisar os detalhes da viagem, incluindo o destino, o transporte selecionado, a data e o horário. O usuário também pode cancelar a viagem ou marcá-la como concluída.

### 4. **Histórico de Viagens (TravelsPage)**

Exibe uma lista de todas as viagens que o usuário concluiu. Para cada viagem, são exibidos os detalhes como o meio de transporte, a data e o destino.

## Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento multiplataforma (Android, iOS, Web, Desktop).
- **Dart**: Linguagem de programação usada pelo Flutter.