import 'dart:ui';

import 'package:flutter/material.dart';

class SellBaseScreen extends StatefulWidget {
  const SellBaseScreen({Key? key}) : super(key: key);

  @override
  State<SellBaseScreen> createState() => _SellBaseScreenState();
}

class _SellBaseScreenState extends State<SellBaseScreen> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff385f67),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.9,
        title: Text(
          'What are you offering?',
          style: TextStyle(color: Color(0xff385f67), fontSize: 19),
        ),
      ),
      body: Row(
        children: [

          Stack(
            children: [
              Container(
              height: mheight*0.17,
              width:mwidth*0.33 ,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/photo-1617347454431-f49d7ff5c3b1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(0.1),
            child: Text(
              "delivery",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
    )
              )
              )
              ),
               ],
          ),

           Padding(
             padding:  EdgeInsets.only(left:mwidth*0.09 ),
             child: Container(
                height: mheight*0.17,
                width:mwidth*0.33 ,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/wp7054127.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  // make sure we apply clip it properly
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withOpacity(0.1),
                          child: Text(
                            "Cat",
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        )
                    )
                )
          ),
           ),
    ]
      ),
    );
  }
}
