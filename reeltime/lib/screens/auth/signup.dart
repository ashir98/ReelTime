import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reeltime/app.dart';
import 'package:reeltime/screens/auth/signin.dart';
import 'package:reeltime/widgets/buttons/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController pwController = TextEditingController();

  TextEditingController confirmPwController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg.jpg',
          ),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withAlpha(210), 
            BlendMode.darken
          )
        )
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1,sigmaY: 1),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height
                  ),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 70.verticalSpace,
                          // LOGO
                          Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 200.w,
                            ),
                          ),
                                    
                          20.verticalSpace,
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              
                              hintText: "Name",
                              prefixIcon: Icon(EvaIcons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your name";
                              }
                              return null; 
                            },
                          ),
                          10.verticalSpace,
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(EvaIcons.email_outline)
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                                    
                          ),
                          10.verticalSpace,
                          TextFormField(
                            controller: pwController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(EvaIcons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  
                                }, 
                                icon: Icon(EvaIcons.eye_outline)
                              )
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
                          TextFormField(
                            controller: confirmPwController,
                            decoration: InputDecoration(
                              hintText: "Confirm password",
                              prefixIcon: Icon(EvaIcons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  
                                }, 
                                icon: Icon(EvaIcons.eye_outline)
                              )
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please confirm your password";
                              }
                              if (value != pwController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          20.verticalSpace,
                                    
                          
                                    
                          CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                
                              }
                            },
                            child: Text("Register"),
                          ),
                          5.verticalSpace,
                                    
                                    
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?"),
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen(),));
                                }, 
                                child: Text("Signin")
                              ),
                            ],
                          )
                          
                          
                          
                      
                      
                      
                      
                          // Container(
                          //   width: double.infinity,
                          //   height: 400.h,
                          //   color: Colors.amber,
                          // )
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