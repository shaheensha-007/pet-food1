import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/LoginScreens/forget_password_screen.dart';
import 'package:pet_shop/LoginScreens/signup_page.dart';
import 'package:pet_shop/Widgets/toast_message.dart';
import 'package:pet_shop/home_screen.dart';
import 'package:pet_shop/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}
TextEditingController loginPageEmail = TextEditingController();
TextEditingController loginPagePassword = TextEditingController();
String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$";
final form_key = GlobalKey<FormState>();
String loginpage_email1 = '';
String loginpage_password1 = '';
class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    FirebaseAuth auth=FirebaseAuth.instance;

    RegExp regex = RegExp(pattern);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: mwidth,
            height: mheight,
            color: const Color(0xff142c44),
          ),Positioned(
              top: mheight * 0.078,left: mwidth*0.152,
              child: Image.asset(
                'assets/login.png',
                height: mheight * 0.35,
                width: mwidth * 0.71,
              )),
          Positioned(
            bottom: 0,
            child: Container(
              width: mwidth,
              height: mheight * 0.57,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Form(
                key: form_key,
                child: Column(
                  children: [SizedBox(height: mheight*0.06),
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
                                  controller: loginPageEmail,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !regex.hasMatch(value)) {
                                      return 'Invalid email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    loginpage_email1 = value!;
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
                          controller: loginPagePassword,
                          validator: (value) {
                            if ( value!.length < 6) {
                              return 'Password should be atleast 6 character';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            loginpage_password1= value!;
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
                            auth.signInWithEmailAndPassword(email: loginPageEmail.text, password: loginPagePassword.text).then((value)async{
                              final preferences=await SharedPreferences.getInstance();
                              preferences.setBool(keyValue, true);
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const HomeScreen()));
                            }).onError((error, stackTrace) {
                              ToastMessage().toastmessage(message: error.toString());
                            });

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
                              'Login',
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
                    Row(
                      children: [
                        SizedBox(
                          width: mwidth * 0.63,
                        ),
                        TextButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>ForgetPassword())),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mheight * 0.02,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: mwidth * 0.225,
                          ),
                          const Text(
                            'Dont have an account?',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Signup_Page()));
                            },
                            child: const Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )
         ]) ),
            ))]),
    );
  }
}
