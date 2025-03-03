import 'package:doctor_appointment_app/screen/home/home_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController =
      TextEditingController(text: "test@boodskap.io");
  final TextEditingController passwordController =
      TextEditingController(text: "welcome123");
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  void continueWithGoogle() {
    // Handle Google sign-in
  }

  void continueWithFacebook() {
    // Handle Facebook sign-in
  }

  void signUp() {
    // Navigate to sign-up scRreen
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo-hospital.png",
                  width: screenWidth * 0.15, height: screenWidth * 0.18),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Health",
                      style: AppTypography.h1.copyWith(color: Colors.grey)),
                  Text("Pal", style: AppTypography.h1),
                ],
              ),
              SizedBox(height: 20),
              Text("Hi, Welcome Back!", style: AppTypography.h1),
              SizedBox(height: 5),
              Text("Hope you're doing fine.",
                  style:
                      AppTypography.bodySBold.copyWith(color: Colors.grey)),
              SizedBox(height: 35),
              _buildTextField(
                  emailController, "Your Email", Icons.email, screenWidth,
                  isEmail: true),
              SizedBox(height: 15),
              _buildTextField(
                  passwordController, "Password", Icons.lock, screenWidth,
                  isPassword: true),
              SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {
                      _showInvalidCredentialsDialog(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1C2A3A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text("Sign In",
                      style: AppTypography.bodySBold
                          .copyWith(color: Colors.white)),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: .5,
                    color: Colors.grey,
                  )),
                  SizedBox(width: 10),
                  Text("or",
                      style:
                          AppTypography.bodyLG.copyWith(color: Colors.grey)),
                  SizedBox(width: 10),
                  Expanded(
                      child: Divider(
                    thickness: .5,
                    color: Colors.grey,
                  )),
                ],
              ),
              SizedBox(height: 30),
              _buildSocialButton(
                  "Sign In with Google",
                  "assets/images/google.png",
                  continueWithGoogle,
                  screenWidth),
              SizedBox(height: 10),
              _buildSocialButton(
                  "Sign In with Facebook",
                  "assets/images/facebook.png",
                  continueWithFacebook,
                  screenWidth),
              SizedBox(height: 25),
              Text("Forgot Password",
                  style: AppTypography.bodySSemiBold
                      .copyWith(color: Colors.blue, fontSize: 18)),
              SizedBox(height: 20),
              GestureDetector(
                onTap: signUp,
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account yet? ",
                    style: AppTypography.bodyLG.copyWith(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "  Sign Up",
                        style: AppTypography.bodySBold
                            .copyWith(color: Colors.blue, fontSize: 18),
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

  Widget _buildTextField(TextEditingController controller, String hint,
      IconData icon, double screenWidth,
      {bool isPassword = false, bool isEmail = false}) {
    return SizedBox(
      width: screenWidth * 0.8,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            obscureText: isPassword ? _obscureText : false,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            cursorColor: Colors.grey,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field cannot be empty";
              }
              if (isEmail &&
                  !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                      .hasMatch(value)) {
                return "Enter a valid email";
              }
              if (isPassword && value.length < 6) {
                return "Password must be at least 6 characters";
              }
              if (value.isEmpty) {
                return "This field cannot be empty";
              }
              if (isEmail && value != "test@boodskap.io") {
                return "Invalid email";
              }
              if (isPassword && value != "welcome123") {
                return "Invalid password";
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(icon, size: screenWidth * 0.05),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              hintText: hint,
              hintStyle: AppTypography.bodySRegular,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.1, color: Colors.grey)),
              filled: true,
              fillColor: Color(0xfff7f9fa),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 0),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
      String text, String asset, Function onPressed, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.8,
      height: 45,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey, width: 0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset,
                width: screenWidth * 0.05, height: screenWidth * 0.05),
            SizedBox(width: 10),
            Text(text,
                style:
                    AppTypography.bodyXSMedium.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

void _showInvalidCredentialsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:
            Text("Login Failed", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text("Invalid email or password."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK", style: TextStyle(color: Colors.blue)),
          ),
        ],
      );
    },
  );
}
