import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<String> getLoadingMessage() {
      final message = <String>[
        'Espere un momento',
        'Cargando...',
        'Por favor espere',
        'Estamos trabajando en ello',
        'Un momento por favor',
        'Cargando datos',
        'Estamos casi listos',
        'Por favor, tenga paciencia',
        'Cargando información',
        'Estamos preparando algo especial para usted',
      ];

      return Stream.periodic(const Duration(milliseconds: 1200), (step) {
        return message[step];
      }).take(message.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Espere un momento'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessage(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox();
              return Text(snapshot.data!, style: const TextStyle(fontSize: 16));
            },
          ),
        ],
      ),
    );
  }
}
