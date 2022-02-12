import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';
class PooCoin extends StatelessWidget {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('PooCoin',
            style: TextStyle(fontFamily: 'BankGR', fontSize: 16),),
          actions: [
            IconButton(onPressed: () {
              controller.goBack();
            },

                icon: Icon(Icons.arrow_back)),
            IconButton(onPressed: () {

              Share.share('https://poocoin.app/tokens/0xad26c90ac66ecd68509ec128bdb24ff32804fb54');
            },

                icon: Icon(Icons.share))

          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://poocoin.app/tokens/0xad26c90ac66ecd68509ec128bdb24ff32804fb54',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      );

}