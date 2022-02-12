import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';
class DexTools extends StatelessWidget {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Dex Tools',
            style: TextStyle(fontFamily: 'BankGR', fontSize: 16),),
          actions: [
            IconButton(onPressed: () {
              controller.goBack();
            },

                icon: Icon(Icons.arrow_back)),
            IconButton(onPressed: () {

              Share.share('https://www.dextools.io/app/bsc/pair-explorer/0xdee26185c9c1b813b6b2aeec41e3f6dfdc3dda3c');
            },

                icon: Icon(Icons.share))
          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://www.dextools.io/app/bsc/pair-explorer/0xdee26185c9c1b813b6b2aeec41e3f6dfdc3dda3c',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      );

}