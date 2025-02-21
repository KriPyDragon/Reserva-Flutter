import 'package:flutter/material.dart';
import 'layouts/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reserva de Restaurantes',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const CustomDrawer(), // 🔹 Drawer mejorado
      body: Stack(
        children: [
          // 🔹 Imagen de fondo expandida
          Positioned.fill(
            child: Image.asset(
              'assets/tayceci.jpg',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              color: Colors.black.withAlpha((0.6 * 255).toInt()),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Menú",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // 🔹 Cuadro de búsqueda
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Buscar en el menú...",
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withAlpha((0.2 * 255).toInt()),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _menuItem("Entrada"),
                  _menuItem("Segundo plato"),
                  _menuItem("Bebida"),
                  _menuItem("Extras"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Widget para menú de platos
  Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
