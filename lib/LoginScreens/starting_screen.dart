import 'package:flutter/material.dart';


class Starting_Screen extends StatefulWidget {
  const Starting_Screen({Key? key}) : super(key: key);

  @override
  State<Starting_Screen> createState() => _Starting_ScreenState();
}

class _Starting_ScreenState extends State<Starting_Screen> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mheight * 0.035,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.06),
                child: const Text(
                  'Hello!',
                  style: TextStyle(
                      color: Color(0xff264050),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: SizedBox(
                  width: mwidth * 0.8,
                  height: mheight * 0.4,
                  child: Image.asset(
                    'assets/startingscreenicon.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.005,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.078),
                child: const  Text(
                  'Find Your Pet With Us',
                  style: TextStyle(
                      color: Color(0xff264050),
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
              ),SizedBox(
                height: mheight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.078),
                child: const  Text(
                  'Join And Discover The Best Pet\n In Your Location ',
                  style: TextStyle(
                      color: Color(0xffc0c0c0),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: mheight * 0.06,
              ),
              Center(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const  Color(0xffffd24f),
                        borderRadius: BorderRadius.circular(12)),
                    width: mwidth * 0.92,
                    height: mheight * 0.075,
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
