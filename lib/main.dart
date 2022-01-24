import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview"),
        centerTitle: true,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://www.papayacoders.in/",
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.import_export,
          size: 32,
        ),
        onPressed: () async {
          controller.runJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'");
        },
      ),
    );
  }
}
