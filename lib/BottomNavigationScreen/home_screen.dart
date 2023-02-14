import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    final double itemHeight = mheight * 0.28;
    final double itemWidth = size.width / 2;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            toolbarHeight: 0,
            centerTitle: false,
            elevation: 0,
            backgroundColor: Color(0xff6fb8b2),
            automaticallyImplyLeading: false,
            primary: false,
            bottom: PreferredSize(
              preferredSize: Size(mwidth, mheight * 0.14),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      height: mheight * 0.1,
                      width: mwidth * 0.325,
                      'assets/login.png',
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: mwidth * 0.95,
                          height: mheight * 0.065,
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: mwidth * 0.0385,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: mheight * 0.003),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Color(0xff828282),
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                width: mwidth * 0.03,
                              ),
                              Container(
                                  width: mwidth * 0.57,
                                  child: Center(
                                      child: Text(
                                    'Search by keyword or Brand',
                                    style: TextStyle(
                                        color: Color(0xffA5A5A5),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ))),
                              SizedBox(
                                width: mwidth * 0.02,
                              ),
                              Image.asset(
                                'assets/mic_icon.png',
                                height: mheight * 0.03,
                                width: mwidth * 0.075,
                              ),
                              SizedBox(
                                width: mwidth * 0.023,
                              ),
                              Image.asset(
                                height: mheight * 0.03,
                                width: mwidth * 0.075,
                                'assets/camera_icon.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            )),
        backgroundColor: Color(0xff6fb8b2),
        body: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            padding: EdgeInsets.only(
                top: mheight * 0.016,
                left: mwidth * 0.028,
                right: mwidth * 0.02),
            crossAxisCount: 2,
            crossAxisSpacing: mheight * 0.002,
            mainAxisSpacing: mwidth * 0.005,
            shrinkWrap: true,
            children: List.generate(
              15,
              growable: false,
              (index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                  ),
                );
              },
            )));
  }
}
