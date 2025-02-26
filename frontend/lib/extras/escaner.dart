import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '/layouts/header.dart';

class EscanerScreen extends StatefulWidget {
  const EscanerScreen({super.key});

  @override
  State<EscanerScreen> createState() => _EscanerScreenState();
}

class _EscanerScreenState extends State<EscanerScreen> {
  String scannedData = "Escanea un código QR";

  void _scanQR() async {
    final result = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const QRScannerScreen()));

    if (result != null) {
      setState(() {
        scannedData = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Header(), // ✅ Usar Header correctamente
      ),
      drawer: const CustomDrawer(), // ✅ Agregar Drawer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_scanner, size: 100, color: Colors.orange),
            const SizedBox(height: 20),
            Text(
              scannedData,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQR,
              child: const Text('Iniciar Escaneo'),
            ),
          ],
        ),
      ),
    );
  }
}

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Header(),
      ),
      drawer: const CustomDrawer(), // ✅ Agregar Drawer en QRScannerScreen
      body: MobileScanner(
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            debugPrint('Código QR Detectado: ${barcode.rawValue}');
            if (barcode.rawValue != null) {
              Navigator.pop(context, barcode.rawValue);
            }
          }
        },
      ),
    );
  }
}
