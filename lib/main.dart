import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // الشاشة הראשية التي ستبدأ هي شاشة تسجيل الدخول
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // للتحكم في حقول النص
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _performLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // محاكاة بسيطة للتحقق: إذا لم تكن الحقول فارغة، انتقل
    if (email.isNotEmpty && password.isNotEmpty) {
      // نستخدم pushReplacement لكي لا يستطيع المستخدم العودة لشاشة تسجيل الدخول بعد النجاح
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // إظهار رسالة خطأ إذا كانت الحقول فارغة
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى ملء كافة الحقول')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'مرحباً بك',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // حقل البريد الإلكتروني
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            // حقل كلمة المرور
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true, // لإخفاء كلمة المرور
            ),
            const SizedBox(height: 30),
            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: _performLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('تسجيل الدخول', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// شاشة الصفحة الرئيسية (HomeScreen) للوصول إليها بعد تسجيل الدخول
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        backgroundColor: Colors.green, // لون مختلف للتمييز
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'تم تسجيل الدخول بنجاح!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
