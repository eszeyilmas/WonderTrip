import 'package:flutter/material.dart';
// Signup ekranına geçiş için import
import 'package:flutter_application_wondertrip/signup_screen.dart'; 

// 🛑 LoginScreen artık durum yönetimi yapabilmek için StatefulWidge'a dönüştürüldü.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ✅ DURUM (STATE): Checkbox'ın işaretli olup olmadığını tutar
  bool _rememberMe = false;

  // Buton Fonksiyonu: Yeni bir ekrana geçişi sağlar
  void _goToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double defaultPadding = screenSize.width * 0.04; // %4 marjin

    return Scaffold(
      backgroundColor: const Color(0xFF119DA4), // Turkuaz arka plan
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: screenSize.height * 0.05), // Üstten biraz boşluk
        child: Stack(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              color: const Color(0xFF119DA4),
            ),

            // 1. Başlık: 'Welcome Back!'
            Positioned(
              left: 15,
              top: screenSize.height * 0.12, // %12 yükseklik
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Color(0xFFF6F6F6),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // 2. Alt Başlık: 'Sign in to continue...'
            Positioned(
              left: 15,
              top: screenSize.height * 0.17,
              child: const Text(
                'Sign in to continue where you left off',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // 3. Username Label
            Positioned(
              left: defaultPadding,
              top: screenSize.height * 0.25,
              child: const Text(
                'Username',
                style: TextStyle(
                  color: Color(0xFFF6F6F6),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // 4. Username TextField
            Positioned(
              left: defaultPadding,
              right: defaultPadding,
              top: screenSize.height * 0.29, // %29 yükseklik
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFBC9B8F), // Açık kahve/gri tonu
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),

            // 5. Password Label
            Positioned(
              left: defaultPadding,
              top: screenSize.height * 0.38,
              child: const Text(
                'Password',
                style: TextStyle(
                  color: Color(0xFFF6F6F6),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // 6. Password TextField
            Positioned(
              left: defaultPadding,
              right: defaultPadding,
              top: screenSize.height * 0.42,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFBC9C90), // Farklı açık kahve/gri tonu
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true, // Şifre gizleme
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),

            // 7. Remember Me Checkbox ve Label
            Positioned(
              left: defaultPadding,
              top: screenSize.height * 0.51,
              child: Row(
                children: [
                  // ✅ CHECKBOX WIDGET'I
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _rememberMe = newValue ?? false;
                        });
                      },
                      activeColor: const Color(0xFFFB8F67), // Turuncu renk
                      checkColor: const Color(0xFF212121), // İşaret rengi
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xFFE0E0E0),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // 8. Forget Password Link
            Positioned(
              right: defaultPadding,
              top: screenSize.height * 0.51 + 4, // Yükseklik hizalaması
              child: const Text(
                'Forget password?',
                style: TextStyle(
                  color: Color(0xFFE0E0E0),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // 9. Login Butonu
            Positioned(
              left: defaultPadding,
              right: defaultPadding,
              top: screenSize.height * 0.60,
              child: GestureDetector(
                onTap: () {
                  // İleride Login API çağrısı buraya gelecek
                  debugPrint('Login butonuna tıklandı. Remember Me: $_rememberMe');
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFB8F67), // Turuncu renk
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 10. Sign Up Link (Tıklanabilir TextSpan)
            Positioned(
              left: defaultPadding,
              right: defaultPadding,
              top: screenSize.height * 0.70,
              child: Center(
                child: GestureDetector(
                  onTap: () => _goToScreen(context, const SignupScreen()),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            color: Color(0xFFF6F6F6),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: const Color(0xFFFB8F67),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
