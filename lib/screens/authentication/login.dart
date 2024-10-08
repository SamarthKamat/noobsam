import 'package:hotel_booking/constants/ImportFiles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.2),
              Text(
                "WELCOME",
                style: GoogleFonts.poppins(
                  fontSize: screenHeight * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              CustomTextField(
                controller: emailController,
                labelText: "Email",
                hintText: '',
                validator: (value) {},
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: passwordController,
                labelText: "Password",
                isPassword: true,
                hintText: '',
                validator: (value) {},
              ),
              SizedBox(height: screenHeight * 0.01),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    String? email = await showDialog(
                      context: context,
                      builder: (context) => ForgotPasswordDialog(),
                    );

                    if (email!.isNotEmpty) {
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Password reset email sent')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${e.toString()}')),
                        );
                      }
                    }
                  },
                  child: const Text("Forgot Password?"),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    AuthService.loginWithEmailAndPassword(
                      context,
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.teal,
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        fontSize: screenHeight * 0.025,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Or With")],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(
                    imagePath: 'assets/icons/Google__G__logo.png',
                    loginMethod: signInWithGoogle,
                    iconSize: screenHeight * 0.03,
                  ),
                  SizedBox(width: screenWidth * 0.05), // Reduce spacing
                  SocialLoginButton(
                    imagePath: 'assets/icons/Apple_logo_black.png',
                    loginMethod: signInWithApple,
                    iconSize: screenHeight * 0.03,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
