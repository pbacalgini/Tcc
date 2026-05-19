import 'package:flutter/material.dart';
import 'login.dart'; // IMPORT DA TELA DE LOGIN

// ─── MODEL ────────────────────────────────────────────────────────────────────

class MenuCard {
  final String title;
  final String description;
  final IconData icon;
  final Color iconBgColor;
  final VoidCallback onTap;

  const MenuCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBgColor,
    required this.onTap,
  });
}

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
  );
}

// ─── GRADIENTE ZELOO ──────────────────────────────────────────────────────────

const _zelooGradient = LinearGradient(
  colors: [Color(0xFF00C6D7), Color(0xFF0077B6)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

// ─── APP BAR ──────────────────────────────────────────────────────────────────

class ZelooAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZelooAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: _zelooGradient),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 67,
          child: Row(
            children: const [Expanded(child: Center(child: _ZelooLogo()))],
          ),
        ),
      ),
    );
  }
}

// ─── LOGO ─────────────────────────────────────────────────────────────────────

class _ZelooLogo extends StatelessWidget {
  const _ZelooLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/imagens/logo.png', height: 67);
  }
}

// ─── HOME PAGE ────────────────────────────────────────────────────────────────

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // LISTA DOS CARDS
    final List<MenuCard> _cards = [
      MenuCard(
        title: 'Categorias de serviços',
        description: 'Explore diversas categorias de serviços disponíveis.',
        icon: Icons.dashboard_outlined,
        iconBgColor: const Color(0xFFFF6B35),
        onTap: () {},
      ),

      MenuCard(
        title: 'Perfil',
        description: 'Visualize e edite suas informações pessoais.',
        icon: Icons.person_outline,
        iconBgColor: const Color(0xFF0077B6),
        onTap: () {},
      ),

      MenuCard(
        title: 'Meus Serviços',
        description: 'Acompanhe e gerencie os serviços que você oferece.',
        icon: Icons.assignment_outlined,
        iconBgColor: const Color(0xFF00B4D8),
        onTap: () {},
      ),

      // CARD CADASTRO/LOGIN
      MenuCard(
        title: 'Cadastro/Login',
        description: 'Acesse sua conta ou crie um novo cadastro.',
        icon: Icons.lock_person_outlined,
        iconBgColor: const Color(0xFF0077B6),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const ZelooAppBar(),

      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(gradient: _zelooGradient),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 8),

            const Text(
              'Bem Vindo Ao Zeloo',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1A1A2E),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              padding: const EdgeInsets.all(16),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // COLUNA ESQUERDA
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 170,
                          child: _MenuCardWidget(card: _cards[0]),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          height: 170,
                          child: _MenuCardWidget(card: _cards[2]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // COLUNA DIREITA
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 170,
                          child: _MenuCardWidget(card: _cards[1]),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          height: 170,
                          child: _MenuCardWidget(card: _cards[3]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── CARD WIDGET ──────────────────────────────────────────────────────────────

class _MenuCardWidget extends StatelessWidget {
  final MenuCard card;

  const _MenuCardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: card.onTap,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(16),

          border: Border.all(color: const Color(0xFFEEEEEE)),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                color: card.iconBgColor,
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(card.icon, color: Colors.white, size: 28),
            ),

            const SizedBox(height: 10),

            Text(
              card.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
                color: Color(0xFF1A1A2E),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              card.description,
              style: TextStyle(
                fontSize: 11.5,
                color: Colors.grey[600],
                height: 1.3,
              ),
            ),

            const Spacer(),

            Align(
              alignment: Alignment.centerRight,

              child: Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
