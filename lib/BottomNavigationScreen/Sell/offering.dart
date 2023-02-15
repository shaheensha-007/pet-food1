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
      body: Container(
        width: mwidth * 0.33,
        height: mheight * 0.17,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Color(0xff385f67))),
        child: Center(child: Container(width: mwidth*0.03,),),
      ),
    );
  }
}
