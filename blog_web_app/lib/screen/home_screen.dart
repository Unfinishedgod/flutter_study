import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final uri = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {

  // WebViewController 선언
  // WebViewController webViewController = WebViewController();
    // // WebViewController의 loadRequest() 함수를 실행
    // ..loadRequest(Uri.parse('https://blog.codefactory.ai'))
    // // Javascript가 제한 없이 실행될 수 있도록 설정
    // ..setJavaScriptMode(JavaScriptMode.unrestricted);
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
      onPageFinished: (String url){
        print(url);
      }
    ))
    ..loadRequest(uri); // ❶ 컨트롤러 변수 생성

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

        //  AppBar에 액션 버튼을 추가할 수 있는 매개변수
        actions: [
          IconButton(
            // 눌럿을 때 콜백 함수 설정
            onPressed: () {
              // 웹뷰에서 보여줄 사이트 실행
              controller.loadRequest(uri);
            },

            // 홈 버튼 아이콘 설정
            icon: Icon(
              Icons.home,
            )
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,)
    );
  }
}