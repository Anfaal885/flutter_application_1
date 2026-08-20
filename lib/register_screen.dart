import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),

      body: Center(
        child: SizedBox(
          width: 390,
          height: screenHeight,

          child: Stack(
            children: [

              // ==============================
              // GREEN PLANT BACKGROUND
              // ==============================
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 215,
                child: Image.asset(
                  'assets/images/plant.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Dark overlay
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 215,
                child: Container(
                  color: Colors.black.withOpacity(0.25),
                ),
              ),

              // ==============================
              // BACK BUTTON
              // ==============================
              Positioned(
                top: 27,
                left: 18,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 31,
                    height: 31,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              // ==============================
              // LOGO
              // ==============================
              const Positioned(
                top: 48,
                left: 0,
                right: 0,
                child: Icon(
                  Icons.spa,
                  color: Colors.white,
                  size: 39,
                ),
              ),

              // ==============================
              // REGISTER TITLE
              // GREEN BACKGROUND PAR
              // ==============================
              const Positioned(
                top: 92,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      'Create your new account',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              // ==============================
              // WHITE PANEL
              // ==============================
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                bottom: 0,

                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    28,
                    18,
                    28,
                    6,
                  ),

                  decoration: const BoxDecoration(
                    color: Color(0xfff7f3f3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),

                  child: Column(
                    children: [

                      // First Name
                      _buildTextField(
                        controller: firstNameController,
                        hintText: 'First Name',
                        icon: Icons.person_outline,
                      ),

                      const SizedBox(height: 6),

                      // Last Name
                      _buildTextField(
                        controller: lastNameController,
                        hintText: 'Last Name',
                        icon: Icons.person_outline,
                      ),

                      const SizedBox(height: 6),

                      // Email
                      _buildTextField(
                        controller: emailController,
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 6),

                      // Password
                      _buildTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        icon: Icons.lock_outline,
                        obscureText: obscurePassword,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              obscurePassword =
                                  !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 16,
                            color: Colors.black45,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Confirm Password
                      _buildTextField(
                        controller:
                            confirmPasswordController,
                        hintText: 'Confirm Password',
                        icon: Icons.lock_outline,
                        obscureText:
                            obscureConfirmPassword,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword =
                                  !obscureConfirmPassword;
                            });
                          },
                          icon: Icon(
                            obscureConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 16,
                            color: Colors.black45,
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Terms
                      const Text(
                        'By signing you agree to our Terms of use\n'
                        'and privacy policy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.black54,
                          height: 1.1,
                        ),
                      ),

                      const Spacer(),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xff24964f),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(24),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 3),

                      // Login
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black45,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Already have an account? ',
                              ),
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color:
                                      Color(0xff24964f),
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==============================
  // TEXT FIELD
  // ==============================
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return SizedBox(
      height: 39,
      child: TextField(
        controller: controller,
        obscureText: obscureText,

        style: const TextStyle(
          fontSize: 10,
        ),

        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: const TextStyle(
            fontSize: 9,
            color: Colors.black45,
          ),

          prefixIcon: Icon(
            icon,
            size: 16,
            color: Colors.black38,
          ),

          suffixIcon: suffixIcon,

          filled: true,

          fillColor: const Color(0xffeeebeb),

          contentPadding:
              const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(21),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}