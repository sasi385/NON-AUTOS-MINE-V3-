import 'package:flutter/material.dart';
import '../widgets/backwordbutton-loginpage.dart';
import 'main_screen.dart'; // หน้าที่จะนำทางไป

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 ภาพพื้นหลังเต็มจอ
          Positioned.fill(
            child: Image.asset('assets/images/WELCOME1.png', fit: BoxFit.cover),
          ),

          // 🔹 ปุ่ม Back ด้านบนซ้าย
          const Positioned(top: 32, left: 16, child: BackButtonWidget()),

          // 🔹 ปุ่ม START ล่างสุดของจอ
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: _StartButton(),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ ปุ่ม START ฝังไว้ในไฟล์นี้เลย
class _StartButton extends StatefulWidget {
  const _StartButton({Key? key}) : super(key: key);

  @override
  State<_StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<_StartButton> {
  bool _isPressed = false;
  bool _isNavigating = false;

  void _goToNextPage() async {
    if (_isNavigating) return;
    setState(() => _isNavigating = true);

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MAINHomePage()),
    );

    setState(() => _isNavigating = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xFF8BC7AD),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(80),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 0)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: _goToNextPage,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: SizedBox(
            width: double.infinity,
            child: const Text(
              'START',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Barlow Semi Condensed',
                fontSize: 48,
                fontWeight: FontWeight.w800,
                color: Color(0xFFFAF5EF),
                letterSpacing: 2.4,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 0),
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
