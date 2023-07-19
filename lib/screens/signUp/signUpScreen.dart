import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/constants.dart';
import '../signIn/signInScreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 800.h),
              Text(
                "Sign Up",
                style: GoogleFonts.raleway(
                    fontSize: 40, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          // LoginTextForm(prefixIcon: Icons.abc, hintText: "Name"),
          // kFormField30,
          // LoginTextForm(prefixIcon: Icons.email, hintText: "Email"),
          // kFormField30,
          // LoginTextForm(prefixIcon: Icons.password, hintText: "Password"),
          // kFormField30,
          // LoginTextForm(
          //     prefixIcon: Icons.password, hintText: "Confirm Password"),
              kFormField100,
              ElevatedButton(
              onPressed: () {},
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account !"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
