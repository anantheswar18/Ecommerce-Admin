import 'package:ecommerce_admin/authentication/auth.dart';
import 'package:ecommerce_admin/authentication/widget_Tree.dart';
import 'package:ecommerce_admin/screens/signUp/signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../commonWidgets/loginTextForm.dart';
import '../../const/constants.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth()
          .signInWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text)
          .then((value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WidgetTree(),
                ),
              ));
      
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Hum ? $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 500.h),
                Text(
                  "Sign In",
                  style: GoogleFonts.raleway(
                      fontSize: 40, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Image.asset(
              'asset/loginImages/Login_Image-removebg-preview.png',
              // width: 800.w,
              // height: 600.h,
              scale: 2.5,
            ),
            kFormField100,
            LoginTextForm(
                prefixIcon: Icons.email,
                hintText: "Email or Phone",
                controller: _controllerEmail),
            kFormField30,
            LoginTextForm(
              prefixIcon: Icons.lock,
              hintText: "Password",
              passdot: true,
              controller: _controllerPassword,
            ),
            _errorMessage(),
            kFormField100,
            ElevatedButton(
              onPressed: () {
                signInWithEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(900.w, 130.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(
                "Sign In",
                style: TextStyle(fontSize: 18),
              ),
            ),
            kFormField50,
            InkWell(
              onTap: () {},
              child: Container(
                height: 130.h,
                width: 850.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      // offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 130.w,
                    ),
                    ClipOval(
                        child: Image.asset(
                      "asset/loginImages/google icon.png",
                      width: 122.w,
                    )),
                    SizedBox(
                      width: 29.w,
                    ),
                    const Text(
                      "Sign In With Google",
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            kFormField50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New user?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
