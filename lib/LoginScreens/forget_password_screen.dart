import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/Widgets/toast_message.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  final form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    FirebaseAuth auth = FirebaseAuth.instance;

    RegExp regex = RegExp(pattern);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff142c44),
      body: Form(
        key: form_key,
        child: Column(
          children: [
            SizedBox(
              height: mheight * 0.42,
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
                          controller: email,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !regex.hasMatch(value)) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email.text = value!;
                          },
                          decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              hintText: 'Enter Your Registerd Email',
                              hintStyle: TextStyle(color: Color(0xff767676))),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: mheight * 0.012,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  final isvalid = form_key.currentState?.validate();
                  if (isvalid == true) {
                    form_key.currentState?.save();
                    auth
                        .sendPasswordResetEmail(email: email.text)
                        .then((value){ ToastMessage().toastmessage(
                            message: 'Password Reset Email Has Beeen Sent');
                        Navigator.of(context).pop();})
                        .onError((error, stackTrace) => ToastMessage()
                            .toastmessage(message: error.toString()));
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(left: mwidth * 0.01),
                  decoration: BoxDecoration(
                      color: const Color(0xff385f67),
                      borderRadius: BorderRadius.circular(12)),
                  width: mwidth * 0.92,
                  height: mheight * 0.075,
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
