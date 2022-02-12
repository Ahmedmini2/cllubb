import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';
class AgentsTV extends StatelessWidget {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('TV',
            style: TextStyle(fontFamily: 'BankGR', fontSize: 16),),
          actions: [
            IconButton(onPressed: () {
              controller.goBack();
            },

                icon: Icon(Icons.arrow_back)),
            IconButton(onPressed: () {

              Share.share('https://property.cllubb.com/tv');
            },

                icon: Icon(Icons.share))

          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://property.cllubb.com/tv',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      );

}