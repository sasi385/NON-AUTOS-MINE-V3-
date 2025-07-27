import 'package:flutter/material.dart';
// แก้ไขพาธให้ตรงกับโปรเจกต์คุณ
import '/widgets/backwordbutton-loginpage.dart';
import '/screens/test1.dart';
import 'signin_screen.dart';

void main() {
  runApp(const ATECApp());
}

class ATECApp extends StatelessWidget {
  const ATECApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATEC - Child Development',
      theme: ThemeData(
        fontFamily: 'BarlowSemiCondensed',
        primarySwatch: Colors.brown,
      ),
      home: const ATECHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ATECHomePage extends StatefulWidget {
  const ATECHomePage({super.key});

  @override
  State<ATECHomePage> createState() => _ATECHomePageState();
}

class _ATECHomePageState extends State<ATECHomePage> {
  String? selectedSex;
  final TextEditingController _childNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  static const Color atecBrown = Color(0xFF5F4A46);
  static const Color atecLightBg = Color(0xFFF5F3F0);
  static const Color atecGreen = Color(0xFF8ACCAF);
  static const Color atecMuted = Color(0xFFC3B8B1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: atecBrown,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 512),
              margin: const EdgeInsets.only(left: 4),
              child: Column(
                children: [
                  // Header Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(40, 56, 40, 32),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 12,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: atecGreen,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [atecGreen, const Color(0xFF34D399)],
                                ),
                              ),
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assets/images/ICON.png',
                                  ), // ✅ รูปภาพ
                                  backgroundColor:
                                      Colors.transparent, // ✅ พื้นหลังโปร่งใส
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'ATEC',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.4,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Hello! A safe and fun space for every child\'s development.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Form Card
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(60),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(48, 48, 48, 96),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFormField(
                          'ชื่อของเด็ก',
                          _childNameController,
                          'Enter child\'s name',
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'วันกิด',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '(รูปแบบ: MM/DD/YYYY, Example: 09/25/1998)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: atecMuted,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(_dateOfBirthController, 'MM/DD/YYYY'),
                        const SizedBox(height: 32),
                        const Text(
                          'เพศ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            _buildRadioOption('female', 'หญิง'),
                            const SizedBox(width: 48),
                            _buildRadioOption('male', 'ชาย'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Bottom Navigation
                  Container(
                    height: 80,
                    color: atecBrown,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        // ✅ ปุ่มซ้าย - กลับไปหน้า SignInScreen
                        buildNavButton2(Icons.chevron_left, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        }),

                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(left: 8),
                                width: 56,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: atecBrown,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ✅ ปุ่มขวา - ไปหน้า Test1Screen
                        buildNavButton2(Icons.chevron_right, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Test1Screen(),
                            ),
                          );
                        }),
                      ],
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

  Widget _buildFormField(
    String label,
    TextEditingController controller,
    String placeholder,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: atecBrown,
          ),
        ),
        const SizedBox(height: 16),
        _buildTextField(controller, placeholder),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String placeholder) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: atecLightBg,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: placeholder,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
        ),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildRadioOption(String value, String label) {
    final isSelected = selectedSex == value;
    return GestureDetector(
      onTap: () => setState(() => selectedSex = value),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? atecBrown : atecMuted,
            ),
            child: isSelected
                ? const Center(
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isSelected ? atecBrown : atecMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavButton2(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: atecBrown, size: 24),
        onPressed: onPressed,
      ),
    );
  }

  Widget buildNavButton1(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: atecBrown, size: 24),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _childNameController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }
}
