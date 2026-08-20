import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;
  bool rememberMe = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              // LOGIN TITLE
              // GREEN BACKGROUND PAR
              // ==============================
              const Positioned(
                top: 92,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      'Login to your account',
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
                    25,
                    28,
                    7,
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

                      // ==============================
                      // EMAIL
                      // ==============================
                      _buildTextField(
                        controller: emailController,
                        hintText: 'Email / Username',
                        icon: Icons.person_outline,
                      ),

                      const SizedBox(height: 10),

                      // ==============================
                      // PASSWORD
                      // ==============================
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
                            size: 17,
                            color: Colors.black45,
                          ),
                        ),
                      ),

                      const SizedBox(height: 3),

                      // ==============================
                      // REMEMBER + FORGOT
                      // ==============================
                      Row(
                        children: [

                          SizedBox(
                            width: 24,
                            height: 24,

                            child: Checkbox(
                              value: rememberMe,

                              activeColor:
                                  const Color(0xff24964f),

                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,

                              onChanged: (value) {
                                setState(() {
                                  rememberMe =
                                      value ?? false;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 2),

                          const Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black54,
                            ),
                          ),

                          const Spacer(),

                          const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),

                      // ==============================
                      // EXTRA WHITE SPACE
                      // ==============================
                      const Spacer(),

                      // ==============================
                      // LOGIN BUTTON
                      // ==============================
                      SizedBox(
                        width: double.infinity,
                        height: 44,

                        child: ElevatedButton(
                          onPressed: () {},

                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xff24964f),

                            foregroundColor: Colors.white,

                            elevation: 0,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(24),
                            ),
                          ),

                          child: const Text(
                            'Login',

                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      // ==============================
                      // SIGN UP LINK
                      // ==============================
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterScreen(),
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
                                    "Don't have an account? ",
                              ),

                              TextSpan(
                                text: 'Sign up',

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
      height: 42,

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
            vertical: 6,
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