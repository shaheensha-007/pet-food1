import 'dart:core';

import 'package:flutter/material.dart';
import 'package:pet_shop/home_screen.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}
TextEditingController signupPageEmail = TextEditingController();
TextEditingController signupPagePassword = TextEditingController();
TextEditingController userName=TextEditingController();
String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$";
final form_key = GlobalKey<FormState>();
String signuppage_email1 = '';
String signuppage_password1 = '';
String username1='';
class _Signup_PageState extends State<Signup_Page> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;

    RegExp regex = RegExp(pattern);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: [
            Container(
              width: mwidth,
              height: mheight,
              color: Color(0xff142c44),
            ),Positioned(
                top: mheight * 0.075,left: mwidth*0.148,
                child: Image.asset(
                  'assets/signup.png',
                  height: mheight * 0.35,
                  width: mwidth * 0.71,
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  width: mwidth,
                  height: mheight * 0.57,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Form(
                      key: form_key,
                      child: Column(
                          children: [SizedBox(height: mheight*0.06), Center(
                            child: Container(
                              padding: EdgeInsets.only(left: mwidth * 0.01),
                              decoration: BoxDecoration(
                                  color: const Color(0xffF1F1F1),
                                  borderRadius: BorderRadius.circular(12)),
                              width: mwidth * 0.9,
                              height: mheight * 0.085,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: mwidth * 0.04),
                                    child: SizedBox(
                                      width: mwidth * 0.075,
                                      height: mheight * 0.03,
                                      child: Image.asset(
                                        'assets/user.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: mwidth * 0.04),
                                      width: mwidth * 0.756,
                                      height: mheight * 0.08,
                                      child: TextFormField(
                                        controller: userName,
                                        validator: (value) {
                                          if ( value!.isEmpty) {
                                            return 'Field should not be empty';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          username1= value!;
                                        },
                                        decoration: const InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder: InputBorder.none,
                                            hintText: 'Username',
                                            hintStyle:
                                            TextStyle(color: Color(0xff767676))),
                                      )),
                                ],
                              ),
                            ),
                          ),SizedBox(height: mheight*0.03,),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(left: mwidth * 0.01),
                                decoration: BoxDecoration(
                                    color: const Color(0xffF1F1F1),
                                    borderRadius: BorderRadius.circular(12)),
                                width: mwidth * 0.9,
                                height: mheight * 0.085,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: mwidth * 0.05),
                                      child: SizedBox(
                                        height: mheight * 0.03,
                                        width: mwidth * 0.075,
                                        child: Image.asset(
                                          'assets/email.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: mwidth * 0.04, top: mheight * 0.01),
                                        width: mwidth * 0.756,
                                        height: mheight * 0.08,
                                        child: TextFormField(
                                          controller: signupPageEmail,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                !regex.hasMatch(value)) {
                                              return 'Invalid email';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            signuppage_email1 = value!;
                                          },
                                          decoration: const InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder: InputBorder.none,
                                              hintText: 'Email',
                                              hintStyle:
                                              TextStyle(color: Color(0xff767676))),
                                        )),
                                  ],
                                ),
                              ),
                            ), SizedBox(
                              height: mheight * 0.0243,
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(left: mwidth * 0.01),
                                decoration: BoxDecoration(
                                    color: const Color(0xffF1F1F1),
                                    borderRadius: BorderRadius.circular(12)),
                                width: mwidth * 0.9,
                                height: mheight * 0.085,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: mwidth * 0.04),
                                      child: SizedBox(
                                        width: mwidth * 0.075,
                                        height: mheight * 0.03,
                                        child: Image.asset(
                                          'assets/Vector.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: mwidth * 0.04),
                                        width: mwidth * 0.756,
                                        height: mheight * 0.08,
                                        child: TextFormField(
                                          obscureText: true,
                                          controller: signupPagePassword,
                                          validator: (value) {
                                            if ( value!.length < 6) {
                                              return 'Password should be atleast 6 character';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            signuppage_password1= value!;
                                          },
                                          decoration: const InputDecoration(
                                              suffix: Icon(
                                                Icons.remove_red_eye,
                                                color: Color(0xff767676),
                                              ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder: InputBorder.none,
                                              hintText: 'Password',
                                              hintStyle:
                                              TextStyle(color: Color(0xff767676))),
                                        )),
                                  ],
                                ),
                              ),
                            ),  SizedBox(
                              height: mheight * 0.026,
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  final isvalid = form_key.currentState?.validate();
                                  if (isvalid == true) {
                                    form_key.currentState?.save();
                                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomeScreen()));
                                  }},
                                child: Container(
                                  padding: EdgeInsets.only(left: mwidth * 0.01),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff385f67),
                                      borderRadius: BorderRadius.circular(12)),
                                  width: mwidth * 0.92,
                                  height: mheight * 0.075,
                                  child: const Center(
                                    child: Text(
                                      'Signup',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mheight * 0.024,
                            ),
                          ]) ),
                ))]),
    );
  }
}
