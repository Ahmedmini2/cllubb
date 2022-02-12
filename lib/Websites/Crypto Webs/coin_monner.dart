import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';
class CoinMooner extends StatelessWidget {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('CoinMooner',
            style: TextStyle(fontFamily: 'BankGR', fontSize: 16),),
          actions: [
            IconButton(onPressed: () {
              controller.goBack();
            },

                icon: Icon(Icons.arrow_back))
          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://coinmooner.com/coin/11594',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      );

}