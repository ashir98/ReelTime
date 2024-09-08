import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reeltime/widgets/buttons/custom_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withAlpha(210),
            BlendMode.darken,
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).r,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // LOGO
                          Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 200.w,
                            ),
                          ),

                          20.verticalSpace,

                          // Email Input
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(EvaIcons.email_outline),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),

                          10.verticalSpace,

                          // Password Input
                          TextFormField(
                            controller: pwController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(EvaIcons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(EvaIcons.eye_outline),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }
                              // Check if password contains at least one uppercase letter
                              if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                                return "Password must contain at least one uppercase letter";
                              }
                              // Check if password contains at least one digit
                              if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                                return "Password must contain at least one digit";
                              }
                              // Check if password contains at least one special character
                              if (!RegExp(r'^(?=.*[\W_])').hasMatch(value)) {
                                return "Password must contain at least one special character";
                              }
                              // Check if password is at least 8 characters long
                              if (value.length < 8) {
                                return "Password must be at least 8 characters long";
                              }
                              return null;
                            },
                          ),

                          10.verticalSpace,

                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Forget password?"),
                            ),
                          ),

                          20.verticalSpace,

                          // Sign In Button
                          CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Sign-in logic here
                              }
                            },
                            child: Text("Sign in"),
                          ),

                          20.verticalSpace,

                          // Already have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?"),
                              TextButton(
                                onPressed: () {},
                                child: Text("Signin"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
