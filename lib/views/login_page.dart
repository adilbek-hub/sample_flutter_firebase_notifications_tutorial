import 'package:flutter/material.dart';
import 'package:notification_product/controllers/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                  hintText: "Enter you email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                  hintText: "Enter you password"),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                  onPressed: () async {
                    await AuthService.loginWithEmail(
                            emailController.text, passwordController.text)
                        .then((value) {
                      if (value == "Login Successful") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login Successful")));
                        Navigator.pushReplacementNamed(context, "/home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            value,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red.shade400,
                        ));
                      }
                    });
                  },
                  child: const Text("Login")),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("No account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: const Text("Register")),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
