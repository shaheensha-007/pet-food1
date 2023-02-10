import 'package:flutter/material.dart';
import 'package:pet_shop/LoginScreens/login_page.dart';


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
    return Scaffold(backgroundColor: Color(0xff142c44),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.06,top: mheight*0.045),
                child: const Text(
                  'Hello!',
                  style: TextStyle(
                      color: Color(0xffecac54),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Image.asset(width: mwidth * 0.8,
                  height: mheight * 0.5,
                  'assets/startingscreenicon.png',
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
                      color: Color(0xffecac54),
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
              ),SizedBox(
                height: mheight * 0.023,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.078),
                child: const  Text(
                  'Join And Discover The Best Pet\n In Your Location ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: mheight * 0.06,
              ),
              Center(
                child: GestureDetector(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>Login_Page())),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const  Color(0xff385f67),
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
