import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      // body: Text('Home Screen'),
      body: SafeArea(
        // 시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          // 위아래 긑에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // 반대축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          'U&I',
        ),
        const SizedBox(height: 16.0),
        Text(
          '우리 처음 만난 날',
        ),
        Text(
          '2021.11.23',
        ),
        const SizedBox(height: 16.0),
        IconButton(
          iconSize: 60.0,
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'D+365',
        ),
      ],
    );
    // return Text('DDay Widget');
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'asset/img/middle_image.png',

        //  화면의 반만큼 높이 구현
        height: MediaQuery.of(context).size.height / 2,
      ),
    );

    // return Text('Cou8ple image Widget');
  }
}
