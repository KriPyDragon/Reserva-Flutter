import 'package:flutter/material.dart';
import '/layouts/header.dart';

class LoginRegistroScreen extends StatefulWidget {
  const LoginRegistroScreen({super.key});

  @override
  LoginRegistroScreenState createState() => LoginRegistroScreenState();
}

class LoginRegistroScreenState extends State<LoginRegistroScreen> {
  bool isLogin = true; // Cambia entre login y registro
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(), // Eliminado showBackButton
      drawer: const CustomDrawer(), // Agregado el Drawer
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF7043), Color(0xFFFFAB40)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.restaurant,
                    size: 50,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((0.2 * 255).toInt()),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isLogin ? "Iniciar Sesión" : "Registrarse",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildForm(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? "¿No tienes cuenta? Regístrate aquí"
                        : "¿Ya tienes cuenta? Inicia sesión",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        if (!isLogin) ...[
          _customTextField(
            label: "Nombre Completo",
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Ingrese su nombre";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
        ],
        _customTextField(
          label: "Correo Electrónico",
          icon: Icons.email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ingrese un correo";
            } else if (!RegExp(
              r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
            ).hasMatch(value)) {
              return "Ingrese un correo válido";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        _customTextField(
          label: "Contraseña",
          icon: Icons.lock,
          obscureText: true,
          validator: (value) {
            if (value == null || value.length < 6) {
              return "Mínimo 6 caracteres";
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isLogin ? "Iniciando sesión..." : "Registrando usuario...",
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
              );
            }
          },
          child: Text(
            isLogin ? "Iniciar Sesión" : "Registrarse",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _customTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepOrange),
        filled: true,
        fillColor: Colors.orange.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
