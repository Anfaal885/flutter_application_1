import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState
    extends State<RegistrationScreen> {
  // Form
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController();

  // Focus Nodes
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  // State
  String? _selectedGender;
  bool _termsAccepted = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Colors
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color darkNavy = Color(0xFF0F172A);
  static const Color fieldColor = Color(0xFFF1F5F9);
  static const Color lightBlue = Color(0xFFE0ECFF);
  static const Color secondaryText = Color(0xFF64748B);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();

    super.dispose();
  }

  // validate

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name cannot be empty';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email cannot be empty';
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number cannot be empty';
    }

    final phoneRegex = RegExp(r'^[0-9]{10,15}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  // rgstr

  void _register() {
    FocusScope.of(context).unfocus();

    final isValid =
        _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    if (_selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your gender'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please accept the Terms & Conditions',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Registration successful!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }

  //build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkNavy,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 560,
              ),
              child: _buildRegistrationCard(),
            ),
          ),
        ),
      ),
    );
  }

  // crd

  Widget _buildRegistrationCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            const SizedBox(height: 30),

            _buildNameField(),

            const SizedBox(height: 18),

            _buildEmailField(),

            const SizedBox(height: 18),

            _buildPhoneField(),

            const SizedBox(height: 18),

            _buildPasswordField(),

            const SizedBox(height: 18),

            _buildConfirmPasswordField(),

            const SizedBox(height: 26),

            _buildGenderSection(),

            const SizedBox(height: 20),

            _buildTermsSection(),

            const SizedBox(height: 26),

            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  // headar

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius:
                BorderRadius.circular(18),
          ),
          child: const Icon(
            Icons.person_add_alt_1_rounded,
            size: 32,
            color: primaryBlue,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: darkNavy,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Fill in your details to create your account.',
          style: TextStyle(
            fontSize: 14,
            color: secondaryText,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  

  Widget _buildNameField() {
    return _buildTextField(
      controller: _nameController,
      focusNode: _nameFocus,
      nextFocus: _emailFocus,
      label: 'Full Name',
      hint: 'Enter your full name',
      icon: Icons.person_outline_rounded,
      keyboardType: TextInputType.name,
      validator: _validateName,
    );
  }



  Widget _buildEmailField() {
    return _buildTextField(
      controller: _emailController,
      focusNode: _emailFocus,
      nextFocus: _phoneFocus,
      label: 'Email Address',
      hint: 'example@email.com',
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: _validateEmail,
    );
  }

  

  Widget _buildPhoneField() {
    return _buildTextField(
      controller: _phoneController,
      focusNode: _phoneFocus,
      nextFocus: _passwordFocus,
      label: 'Phone Number',
      hint: '03XXXXXXXXX',
      icon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      validator: _validatePhone,
    );
  }


  Widget _buildPasswordField() {
    return _buildTextField(
      controller: _passwordController,
      focusNode: _passwordFocus,
      nextFocus: _confirmPasswordFocus,
      label: 'Password',
      hint: 'Minimum 8 characters',
      icon: Icons.lock_outline_rounded,
      keyboardType:
          TextInputType.visiblePassword,
      obscureText: _obscurePassword,
      validator: _validatePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscurePassword =
                !_obscurePassword;
          });
        },
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
      ),
    );
  }

  

  Widget _buildConfirmPasswordField() {
    return _buildTextField(
      controller: _confirmPasswordController,
      focusNode: _confirmPasswordFocus,
      label: 'Confirm Password',
      hint: 'Re-enter your password',
      icon: Icons.lock_reset_outlined,
      keyboardType:
          TextInputType.visiblePassword,
      obscureText:
          _obscureConfirmPassword,
      validator: _validateConfirmPassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscureConfirmPassword =
                !_obscureConfirmPassword;
          });
        },
        icon: Icon(
          _obscureConfirmPassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
      ),
    );
  }

  

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    FocusNode? nextFocus,
    required String label,
    required String hint,
    required IconData icon,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: darkNavy,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: nextFocus != null
              ? TextInputAction.next
              : TextInputAction.done,
          validator: validator,

          onFieldSubmitted: (_) {
            if (nextFocus != null) {
              FocusScope.of(context)
                  .requestFocus(nextFocus);
            } else {
              _register();
            }
          },

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 14,
            ),

            prefixIcon: Icon(
              icon,
              color: secondaryText,
            ),

            suffixIcon: suffixIcon,

            filled: true,
            fillColor: fieldColor,

            contentPadding:
                const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),

            enabledBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFFE2E8F0),
              ),
            ),

            focusedBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: primaryBlue,
                width: 1.5,
              ),
            ),

            errorBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),

            focusedErrorBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildGenderSection() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: darkNavy,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: _genderOption(
                title: 'Male',
                value: 'Male',
                icon: Icons.male_rounded,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _genderOption(
                title: 'Female',
                value: 'Female',
                icon: Icons.female_rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _genderOption({
    required String title,
    required String value,
    required IconData icon,
  }) {
    final isSelected =
        _selectedGender == value;

    return InkWell(
      borderRadius:
          BorderRadius.circular(15),
      onTap: () {
        setState(() {
          _selectedGender = value;
        });
      },
      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 200),

        padding:
            const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 4,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? lightBlue
              : fieldColor,

          borderRadius:
              BorderRadius.circular(15),

          border: Border.all(
            color: isSelected
                ? primaryBlue
                : const Color(0xFFE2E8F0),
          ),
        ),

        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: _selectedGender,
              activeColor: primaryBlue,
              onChanged: (newValue) {
                setState(() {
                  _selectedGender =
                      newValue;
                });
              },
            ),

            Icon(
              icon,
              color: isSelected
                  ? primaryBlue
                  : secondaryText,
            ),

            const SizedBox(width: 6),

            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected
                    ? FontWeight.w700
                    : FontWeight.w500,
                color: darkNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Trms

  Widget _buildTermsSection() {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius:
            BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: _termsAccepted,
            activeColor: primaryBlue,
            onChanged: (value) {
              setState(() {
                _termsAccepted =
                    value ?? false;
              });
            },
          ),

          const Expanded(
            child: Text.rich(
              TextSpan(
                text: 'I agree to the ',
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' and Privacy Policy.',
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 13,
                color: secondaryText,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  BUTTON 

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _register,

        style:
            ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 3,

          shadowColor:
              primaryBlue.withOpacity(0.35),

          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16),
          ),
        ),

        child: const Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    FontWeight.w700,
              ),
            ),

            SizedBox(width: 10),

            Icon(
              Icons.arrow_forward_rounded,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}