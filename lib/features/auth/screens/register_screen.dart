import 'package:ecomanga/common/app_colors.dart';
import 'package:ecomanga/common/buttons/dynamic_button.dart';
import 'package:ecomanga/common/buttons/scale_button.dart';
import 'package:ecomanga/common/widgets/custom_text_field.dart';
import 'package:ecomanga/features/auth/screens/login_screen.dart';
import 'package:ecomanga/features/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fKey1 = GlobalKey<FormState>();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _agreed = false;

  @override
  void dispose() {
    _phone.dispose();
    _email.dispose();
    _name.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
        ),
        child: Form(
          key: _fKey1,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 30,
                ),
                Image.asset(
                  "assets/icons/app_icon.png",
                  height: 120.h,
                  width: 120,

                  // fit: BoxFit.cover,
                ),
                _headingText(
                  "Get Started",
                ),
                _normalText(
                  "by creating a free account",
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                    hintText: "Full Name",
                    controller: _name,
                    autofocus: true,
                    removeFocusOutside: true,
                    iconData: Icons.person_2_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 3) {
                        return "Name length should be 3 character";
                      }
                      return null;
                    }),
                CustomTextField(
                  hintText: "Email Address",
                  controller: _email,
                  autofocus: true,
                  removeFocusOutside: true,
                  iconData: Icons.email,
                  validator: (value) {
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _phone,
                  hintText: "Enter Phone no",
                  iconData: Icons.call,
                  removeFocusOutside: true,
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "phone can not ve null";
                    } else if (value.length != 10) {
                      return "phone should be of 10 chars";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Password',
                  controller: _password,
                  autofocus: false,
                  removeFocusOutside: true,
                  iconData: Icons.lock_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Password length should be 6 character";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Center(
                    child: FittedBox(
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          Checkbox(
                            activeColor: AppColors.buttonColor,
                            focusColor: Colors.indigoAccent,
                            hoverColor: Colors.indigoAccent,
                            value: _agreed,
                            onChanged: (_) {
                              setState(() {
                                _agreed = !_agreed;
                              });
                            },
                          ),
                          _normalText(
                            "By checking the box you agree to our ",
                          ),
                          ScaleButton(
                            onTap: () {},
                            child: Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DynamicButton.fromText(
                  text: "Sign up",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                ScaleButton(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/google.png",
                          height: 25.h,
                          fit: BoxFit.cover,
                        ),
                        const Spacer(),
                        Text(
                          "Sign up with Google",
                          style: TextStyle(
                            fontSize: 16.h,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ScaleButton(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/facebook.png",
                          height: 25.h,
                          fit: BoxFit.cover,
                        ),
                        const Spacer(),
                        Text(
                          "Sign up with Facebook",
                          style: TextStyle(
                            fontSize: 16.h,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _normalText("Already a member? "),
                    ScaleButton(
                      onTap: () {
                        Utils.go(
                          context: context,
                          screen: const LoginScreen(),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 1.5.h,
                      ),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    _normalText("or"),
                    SizedBox(
                      width: 5.h,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 1.5.h,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                ScaleButton(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "Access as guest",
                        style: TextStyle(
                          fontSize: 16.h,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _headingText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  _normalText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14.sp, color: Colors.black),
    );
  }
}
