import 'package:aplicativo_zeloo/cadastroProfissional.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Profissional',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00B4D8)),
        useMaterial3: true,
      ),
      home: const LoginProfissional(),
    );
  }
}

class LoginProfissional extends StatefulWidget {
  const LoginProfissional({super.key});
  @override
  State<LoginProfissional> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginProfissional> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _senhaVisivel = false;
  bool _lembrarMe = false;
  bool _loading = false;
  String _erro = '';
  void _handleContinuar() {
    setState(() => _erro = '');
    if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
      setState(() => _erro = 'Preencha todos os campos.');
      return;
    }
    final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
    if (!emailRegex.hasMatch(_emailController.text)) {
      setState(() => _erro = 'Informe um e-mail válido.');
      return;
    }
    setState(() => _loading = true);
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() => _loading = false);
      // TODO: navegar para a tela principal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login realizado com sucesso!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sou cliente
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sou cliente',
                    style: TextStyle(color: Color(0xFF00B4D8), fontSize: 14),
                  ),
                ),
              ),
              // Logo
              Center(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/imagens/logo.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Título
              const Text(
                'Bem-Vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111111),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Entre com sua conta de profissional para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Color(0xFF555555)),
              ),
              const SizedBox(height: 24),
              // Campo Email
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE8E8E8),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFF888888),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 16),
              // Campo Senha
              const Text(
                'Senha',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _senhaController,
                obscureText: !_senhaVisivel,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE8E8E8),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFF888888),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF888888),
                    ),
                    onPressed: () {
                      setState(() => _senhaVisivel = !_senhaVisivel);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 12),
              // Lembrar-me + Esqueceu a senha
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _lembrarMe,
                        activeColor: const Color(0xFF00B4D8),
                        onChanged: (v) =>
                            setState(() => _lembrarMe = v ?? false),
                      ),
                      const Text(
                        'Lembrar-me',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: navegar para esqueci senha
                    },
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(fontSize: 13, color: Color(0xFF00B4D8)),
                    ),
                  ),
                ],
              ),
              // Erro
              if (_erro.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    _erro,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFE53E3E),
                    ),
                  ),
                ),
              // Botão Continuar
              Container(
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00B4D8), Color(0xFF0077B6)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: _loading ? null : _handleContinuar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _loading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'Continuar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              // Divider
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xFFDDDDDD))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Ou continue com',
                      style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xFFDDDDDD))),
                ],
              ),
              const SizedBox(height: 16),
              // Google
              Center(
                child: InkWell(
                  onTap: () {
                    // TODO: implementar login com Google
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/imagens/google.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Cadastre-se
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta? ',
                    style: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastroProfissional())),
                      child: const Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF00B4D8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
