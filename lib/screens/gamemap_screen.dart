import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'gamemap_screen.dart'; // ไม่ต้อง import ตัวเอง

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App Design',
      theme: ThemeData(fontFamily: 'Inter'),
      home: GameMapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameMapScreen extends StatefulWidget {
  @override
  State<GameMapScreen> createState() => _GameMapScreenState();
}

class _GameMapScreenState extends State<GameMapScreen> {
  static const Color creamBackground = Color(0xFFF5F3F0);
  static const Color sageGreen = Color(0xFF8BC5A7);
  static const Color goldYellow = Color(0xFFF4C430);
  static const Color coralRed = Color(0xFFFF5A5A);
  static const Color periwinkleBlue = Color(0xFF5A7CFF);
  static const Color mediumGray = Color(0xFF999999);
  static const Color darkGray = Color(0xFF666666);

  double _scaleHome = 1.0;
  double _scaleGame = 1.0;
  double _scaleProfile = 1.0;

  // ✅ ฟังก์ชันนี้อยู่ใน class เดียวกันอย่างถูกต้อง
  void _launchUnityApp() async {
    const packageName = 'com.defaultcompany.template.mobile2d';
    final url = 'intent://#Intent;package=$packageName;end';

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ไม่พบแอป Unity ที่ติดตั้งไว้')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                  child: Row(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/ICON.png'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.white, width: 2.4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 10),
                              spreadRadius: -3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SUTINAN SRIVISET',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: darkGray,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(999),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 15,
                                    offset: Offset(0, 10),
                                    spreadRadius: -3,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: goldYellow,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '\$',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    '12,000,000.00',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: mediumGray,
                                    ),
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

                // Scrollable Steps
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        _buildCircle(goldYellow),
                        SizedBox(height: 24),
                        _buildTriangle(sageGreen),
                        SizedBox(height: 24),
                        _buildCircle(sageGreen),
                        SizedBox(height: 24),
                        _buildTriangle(coralRed),
                        SizedBox(height: 24),
                        _buildCircle(coralRed),
                        SizedBox(height: 24),
                        _buildTriangle(periwinkleBlue),
                        SizedBox(height: 24),
                        _buildCircleButton(periwinkleBlue, _launchUnityApp),
                        SizedBox(height: 96),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // ✅ แก้ไขตรงนี้: Bottom Navigation Bar วางอยู่ล่างสุดของหน้าจอ
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _BottomNavButton(
                      icon: Icons.home,
                      label: 'HOME',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MAINHomePage()),
                        );
                      },
                    ),
                    _BottomNavButton(
                      icon: Icons.games,
                      label: 'GAME',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => GameMapScreen()),
                        );
                      },
                    ),
                    _BottomNavButton(
                      icon: Icons.person,
                      label: 'PROFILE',
                      iconColor: Colors.blue,
                      labelColor: Colors.blue,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => DashboardPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 25,
            offset: Offset(0, 20),
            spreadRadius: -5,
          ),
        ],
      ),
      child: Icon(Icons.lock_outline, size: 60, color: Colors.white),
    );
  }

  // เพิ่มวงกลมสีฟ้ากดได้ (ไม่มีไอคอนล็อก)
  Widget _buildCircleButton(Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 25,
              offset: const Offset(0, 20),
              spreadRadius: -5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTriangle(Color color) {
    return CustomPaint(size: Size(40, 20), painter: TrianglePainter(color));
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// ตัวอย่างหน้าถัดไปที่กดลิงก์ไป
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
        backgroundColor: Color(0xFF5A7CFF),
      ),
      body: Center(
        child: Text('นี่คือหน้าถัดไป!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class _BottomNavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? labelColor;

  const _BottomNavButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor ?? Colors.grey, size: 30),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: labelColor ?? Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
