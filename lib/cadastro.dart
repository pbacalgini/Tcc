import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});
  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}
class _CadastroScreenState extends State<CadastroScreen> {
  final _emailCtrl     = TextEditingController();
  final _telefoneCtrl  = TextEditingController();
  final _senhaCtrl     = TextEditingController();
  final _confirmarCtrl = TextEditingController();
  bool _showSenha      = false;
  bool _showConfirmar  = false;
  bool _loading        = false;
  String _erro         = '';
  // ── Validações ──────────────────────────
  bool get _temMinCaracteres => _senhaCtrl.text.length >= 8;
  bool get _temMaiuscula     => _senhaCtrl.text.contains(RegExp(r'[A-Z]'));
  bool get _temNumero        => _senhaCtrl.text.contains(RegExp(r'[0-9]'));
  bool get _temEspecial      => _senhaCtrl.text.contains(RegExp(r'[^A-Za-z0-9]'));
  bool get _senhaValida      =>
      _temMinCaracteres && _temMaiuscula && _temNumero && _temEspecial;
  bool get _senhasIguais     =>
      _confirmarCtrl.text == _senhaCtrl.text && _senhaCtrl.text.isNotEmpty;
  // ── Cor da barra de força ───────────────
  Color _barColor(int index) {
    final score = [_temMinCaracteres, _temMaiuscula, _temNumero, _temEspecial]
        .where((v) => v)
        .length;
    if (index >= score) return const Color(0xFFE0E0E0);
    const colors = [Color(0xFFEF4444), Color(0xFFF97316),
                    Color(0xFFEAB308), Color(0xFF22C55E)];
    return colors[score - 1];
  }
  // ── Formata telefone ────────────────────
  String _formatTelefone(String val) {
    final d = val.replaceAll(RegExp(r'\D'), '');
    if (d.length <= 2)  return d;
    if (d.length <= 7)  return '(${d.substring(0, 2)}) ${d.substring(2)}';
    if (d.length <= 11) return '(${d.substring(0, 2)}) ${d.substring(2, 7)}-${d.substring(7)}';
    return val;
  }
  void _handleCadastrar() {
    setState(() => _erro = '');
    if (_emailCtrl.text.isEmpty ||
        _telefoneCtrl.text.isEmpty ||
        _senhaCtrl.text.isEmpty) {
      setState(() => _erro = 'Preencha todos os campos.');
      return;
    }
    final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
    if (!emailRegex.hasMatch(_emailCtrl.text)) {
      setState(() => _erro = 'Informe um e-mail válido.');
      return;
    }
    if (!_senhaValida) {
      setState(() => _erro = 'A senha não atende aos requisitos.');
      return;
    }
    if (!_senhasIguais) {
      setState(() => _erro = 'As senhas não coincidem.');
      return;
    }
    setState(() => _loading = true);
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() => _loading = false);
      // TODO: chamada de API / Firebase Auth
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
      Navigator.pop(context); // volta para o login
    });
  }
  @override
  Widget build(BuildContext context) {
    final senhaTexto = _senhaCtrl.text;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Back button ─────────────
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              // ── Logo ─────────────────────
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
              // ── Título ───────────────────
              const Text(
                'Cadastro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111111),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Vamos realizar seu cadastro, precisamos\napenas de algumas informações',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 24),
              // ── Email ────────────────────
              _buildLabel('Email'),
              const SizedBox(height: 6),
              _buildField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              // ── Telefone ─────────────────
              _buildLabel('Telefone'),
              const SizedBox(height: 6),
              _buildField(
                controller: _telefoneCtrl,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_outlined,
                onChanged: (v) {
                  final formatted = _formatTelefone(v);
                  if (formatted != v) {
                    _telefoneCtrl.value = TextEditingValue(
                      text: formatted,
                      selection: TextSelection.collapsed(
                          offset: formatted.length),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              // ── Senha ────────────────────
              _buildLabel('Senha'),
              const SizedBox(height: 6),
              _buildField(
                controller: _senhaCtrl,
                obscureText: !_showSenha,
                prefixIcon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: Icon(
                    _showSenha ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF888888),
                  ),
                  onPressed: () => setState(() => _showSenha = !_showSenha),
                ),
                onChanged: (_) => setState(() {}),
              ),
              // ── Barra de força + requisitos ──
              if (senhaTexto.isNotEmpty) ...[
                const SizedBox(height: 10),
                Row(
                  children: List.generate(4, (i) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: i < 3 ? 4 : 0),
                      height: 4,
                      decoration: BoxDecoration(
                        color: _barColor(i),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  )),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Requisitos da senha:',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF888888),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _reqItem('8 ou mais caracteres',           _temMinCaracteres),
                      _reqItem('Uma letra maiúscula (A-Z)',       _temMaiuscula),
                      _reqItem('Um número (0-9)',                 _temNumero),
                      _reqItem('Um caractere especial (!@#%&*])', _temEspecial),
                    ],
                  ),
                ),
              ],
              // ── Confirmar senha (animado) ──
              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: _senhaValida
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          _buildLabel('Confirme sua senha'),
                          const SizedBox(height: 6),
                          _buildField(
                            controller: _confirmarCtrl,
                            obscureText: !_showConfirmar,
                            prefixIcon: Icons.lock_reset_outlined,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showConfirmar
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xFF888888),
                              ),
                              onPressed: () =>
                                  setState(() => _showConfirmar = !_showConfirmar),
                            ),
                            focusBorderColor: _confirmarCtrl.text.isEmpty
                                ? const Color(0xFF00B4D8)
                                : _senhasIguais
                                    ? const Color(0xFF22C55E)
                                    : const Color(0xFFEF4444),
                            onChanged: (_) => setState(() {}),
                          ),
                          if (_confirmarCtrl.text.isNotEmpty && !_senhasIguais)
                            const Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                'As senhas não coincidem.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFEF4444),
                                ),
                              ),
                            ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              // ── Erro geral ───────────────
              if (_erro.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF5F5),
                    border: Border.all(color: const Color(0xFFFED7D7)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _erro,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFEF4444),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              // ── Botão Cadastrar ──────────
              Container(
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00B4D8), Color(0xFF0077B6)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton.icon(
                  onPressed: _loading ? null : _handleCadastrar,
                  icon: _loading
                      ? const SizedBox(
                          width: 20, height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2.5,
                          ),
                        )
                      : const Icon(Icons.person_add_outlined,
                          color: Colors.white, size: 20),
                  label: _loading
                      ? const SizedBox.shrink()
                      : const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // ── Já tem conta ─────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já tem uma conta? ',
                      style: TextStyle(fontSize: 14, color: Color(0xFF555555))),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'Entrar',
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
  // ── Helpers de UI ──────────────────────
  Widget _buildLabel(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      );
  Widget _buildField({
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    required IconData prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
    Color focusBorderColor = const Color(0xFF00B4D8),
    ValueChanged<String>? onChanged,
  }) =>
      TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE8E8E8),
          prefixIcon: Icon(prefixIcon, color: const Color(0xFF888888), size: 20),
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: focusBorderColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      );
  Widget _reqItem(String label, bool ok) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 16, height: 16,
              decoration: BoxDecoration(
                color: ok ? const Color(0xFF22C55E) : const Color(0xFFE0E0E0),
                shape: BoxShape.circle,
              ),
              child: ok
                  ? const Icon(Icons.check, size: 10, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: ok ? const Color(0xFF22C55E) : const Color(0xFF888888),
                fontWeight: ok ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
}