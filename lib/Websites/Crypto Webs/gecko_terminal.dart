import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';
class GeckoTerminal extends StatelessWidget {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('GeckoTerminal',
            style: TextStyle(fontFamily: 'BankGR', fontSize: 16),),
          actions: [
            IconButton(onPressed: () {
              controller.goBack();
            },

                icon: Icon(Icons.arrow_back)),
            IconButton(onPressed: () {

              Share.share('https://geckoterminal.com/bsc/pools/0x841a514963d8c345de40c92c12d42cdcb98571a9');
            },

                icon: Icon(Icons.share))

          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://geckoterminal.com/bsc/pools/0x841a514963d8c345de40c92c12d42cdcb98571a9',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      );

}