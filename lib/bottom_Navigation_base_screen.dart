import 'package:flutter/material.dart';
import 'package:pet_shop/BottomNavigationScreen/account_screen.dart';
import 'package:pet_shop/BottomNavigationScreen/chat_screen.dart';
import 'package:pet_shop/BottomNavigationScreen/home_screen.dart';
import 'package:pet_shop/BottomNavigationScreen/my_ads_screen.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},child: Text('SELL'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: mheight * 0.06,
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
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey),
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
                          Icons.home,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Chats',
                          style: TextStyle(
                              color:
                              currentTab == 1 ? Colors.blue : Colors.grey),
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
                          Icons.home,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'My Add',
                          style: TextStyle(
                              color:
                              currentTab == 2 ? Colors.blue : Colors.grey),
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
                          Icons.home,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              color:
                              currentTab == 3 ? Colors.blue : Colors.grey),
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
