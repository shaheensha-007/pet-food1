import 'package:flutter/material.dart';
import 'package:pet_shop/BottomNavigationScreen/account_screen.dart';
import 'package:pet_shop/BottomNavigationScreen/chat_screen.dart';
import 'package:pet_shop/BottomNavigationScreen/home_screen.dart';
import 'package:pet_shop/BottomNavigationScreen/my_ads_screen.dart';

import 'BottomNavigationScreen/Sell/offering.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int currentTab = 0;
final screens = [HomeScreen(), ChatScreen(), MyAdScreen(), MyAccountScreen()];
final PageStorageBucket bucket = PageStorageBucket();
Widget currentScreen = HomeScreen();

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0xff385f67),
        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>SellBaseScreen())),child: Text('SELL'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: mwidth*0.02,
        child: Container(
          height: mheight * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: mwidth * 0.04,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab==0?Icons.home:Icons.home_outlined,
                          color: Color(0xff385f67),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: Color(0xff385f67)),
                        )
                      ],
                    ),
                  ), MaterialButton(
                    minWidth: mwidth * 0.04,
                    onPressed: () {
                      setState(() {
                        currentScreen = ChatScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab==1?Icons.chat:Icons.chat_outlined,
                          color:Color(0xff385f67),
                        ),
                        Text(
                          'Chats',
                          style: TextStyle(
                              color: Color(0xff385f67)),
                        )
                      ],
                    ),
                  )
                ],
              ), SizedBox(width: mwidth*0.15,),Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: mwidth * 0.04,
                    onPressed: () {
                      setState(() {
                        currentScreen = MyAdScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab==2?Icons.favorite:Icons.favorite_outline_rounded,
                          color:Color(0xff385f67),
                        ),
                        Text(
                          'My Add',
                          style: TextStyle(
                              color: Color(0xff385f67)),
                        )
                      ],
                    ),
                  ), MaterialButton(
                    minWidth: mwidth * 0.04,
                    onPressed: () {
                      setState(() {
                        currentScreen = MyAccountScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab==3?Icons.account_circle:Icons.account_circle_outlined,
                          color:Color(0xff385f67),
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              color: Color(0xff385f67)),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
