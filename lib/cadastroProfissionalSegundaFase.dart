import 'package:flutter/material.dart';

class CadastroProfissionalScreen extends StatefulWidget {
  @override
  _CadastroProfissionalScreenState createState() =>
      _CadastroProfissionalScreenState();
}

class _CadastroProfissionalScreenState
    extends State<CadastroProfissionalScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _regiaoController = TextEditingController();
  final TextEditingController _disponibilidadeController =
      TextEditingController();
  final TextEditingController _pagamentoController = TextEditingController();

  List<String> portfolioImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com botão voltar e logo
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00BCD4), Color(0xFF2196F3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Z',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Título
              Text(
                'Crie seu perfil\nprofissional',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              SizedBox(height: 12),

              // Descrição
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  children: [
                    TextSpan(text: 'Conte-nos mais sobre '),
                    TextSpan(
                      text: 'você!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ' Complete seu cadastro\nco m mais algumas informações necessárias.',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              // Aviso campos obrigatórios
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  children: [
                    TextSpan(text: '(*) representa campos '),
                    TextSpan(
                      text: 'obrigatórios',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // Campo Nome de preferência
              Text(
                'Nome de preferência',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFF00BCD4),
                    child: Icon(Icons.person, color: Colors.white, size: 28),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Campo Área de atuação
              _buildTextField(
                'Área de atuação*',
                'Ex.: Mecânico; Eletricista; Encanador; Pintor...',
                _areaController,
              ),

              SizedBox(height: 20),

              // Campo Região de atendimento
              _buildTextField(
                'Região de atendimento*',
                'Ex.: São José dos Campos (SP) - Jd. Satélite)',
                _regiaoController,
              ),

              SizedBox(height: 20),

              // Campo Disponibilidade
              _buildTextField(
                'Disponibilidade*',
                'Ex.: Segunda - Sexta: 08:00 - 18:00)',
                _disponibilidadeController,
              ),

              SizedBox(height: 20),

              // Campo Opções de Pagamento
              _buildTextField(
                'Opções de Pagamento*',
                'Ex.: PIX; Dinheiro; Cartões; Boleto...)',
                _pagamentoController,
              ),

              SizedBox(height: 20),

              // Portfolio
              Text(
                'Portfolio (adicione até 10 imagens)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Row(
                children: List.generate(
                  3,
                  (index) => _buildImageUploadBox(index),
                ),
              ),

              SizedBox(height: 30),

              // Botão Continuar
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00BCD4), Color(0xFF2196F3)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Navegar para próxima tela
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ProximaTela()),
                      // );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Center(
                      child: Text(
                        'Continuar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadBox(int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: index < 2 ? 10 : 0),
        child: AspectRatio(
          aspectRatio: 1,
          child: Material(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                // Ação de upload de imagem
                print('Upload imagem $index');
              },
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 32,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFF00BCD4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _areaController.dispose();
    _regiaoController.dispose();
    _disponibilidadeController.dispose();
    _pagamentoController.dispose();
    super.dispose();
  }
}