import 'package:flutter/material.dart';

class CadastroProfissional extends StatefulWidget {
  const CadastroProfissional({super.key});

  @override
  State<CadastroProfissional> createState() => _CadastroProfissionalState();
}

class _CadastroProfissionalState extends State<CadastroProfissional> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _senhaController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _nomeController.dispose();
    _cpfCnpjController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botão Voltar
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),

                  const SizedBox(height: 20),

                  // Logo Zeloo (você precisará adicionar a imagem aos assets)
                  Center(
                    child: Image.asset(
                      'assets/imagens/logo.png',
                      width: 80,
                      height: 80,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Título
                  const Center(
                    child: Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Subtítulo
                  const Center(
                    child: Text(
                      'Bem-vindo ao Zeloo, colaborador!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Descrição
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Vamos realizar seu cadastro como profissional, precisamos apenas de algumas informações.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Campo Email ou Telefone
                  const Text(
                    'Email ou Nº Telefone',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE8E8E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha este campo';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Campo Nome Completo
                  const Text(
                    'Nome completo',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE8E8E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha este campo';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Campo CPF ou CNPJ
                  const Text(
                    'CPF ou CNPJ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _cpfCnpjController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE8E8E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha este campo';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Campo Senha
                  const Text(
                    'Senha',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE8E8E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha este campo';
                      }
                      if (value.length < 6) {
                        return 'A senha deve ter no mínimo 6 caracteres';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  // Texto sobre proteção de dados
                  const Text(
                    'Seus dados são protegidos e usados apenas para garantir a melhor experiência para você.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Botão Cadastrar
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF40E0D0), Color(0xFF1E90FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Implementar lógica de cadastro aqui
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processando cadastro...'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_add, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
