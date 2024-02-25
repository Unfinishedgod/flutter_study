import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

// 타이머 정의 StatefulWidget 사용
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



// _HomeScreenState 정의
class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  // initState() 함수 등록
  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        print('실행!');

        // 현재 페이지 가져오기
        int? nextPage = pageController.page?.toInt();

        if (nextPage == null) {
          return;
        }

        if (nextPage == 4) {
          nextPage = 0;
          // nextPage--;
        } else {
          nextPage++;
        }
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      
      body: PageView( // 페이지뷰 추가
        controller: pageController,
        children: [1,2,3,4,5] // 샘플 리스트 생성
            .map(
        (number) => Image.asset(
          'asset/img/image_$number.jpeg',
          fit: BoxFit.cover, // 이미지 핏 조정
          ),
            )
            .toList(),
      )

    );
  }

}