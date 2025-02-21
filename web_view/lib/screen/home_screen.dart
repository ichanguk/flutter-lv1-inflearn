import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUri = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUri);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                controller.loadRequest(homeUri);
              },
              icon: Icon(
                Icons.home
              ),
          )
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
