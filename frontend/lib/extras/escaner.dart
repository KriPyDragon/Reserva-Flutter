import 'package:flutter/material.dart';
import '../layouts/header.dart';

class EscanerScreen extends StatelessWidget {
  const EscanerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_scanner, size: 100, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              'Escanea un código QR',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para iniciar el escaneo
              },
              child: const Text('Iniciar Escaneo'),
            ),
          ],
        ),
      ),
    );
  }
}
