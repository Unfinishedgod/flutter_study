import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  // WebViewController webViewController = WebViewController();

  HomeScreen({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  앱바 위젯 추가
      appBar: AppBar(
        // 배경색
        backgroundColor:Colors.orange,
        // 앱 타이틀
        title: Text('Code Factory'),
        // 가운데 정렬
        centerTitle: true,
      ),
      body: Text('Home Screen11'),
    );
  }
}