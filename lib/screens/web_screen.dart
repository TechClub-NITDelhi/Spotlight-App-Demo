import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  final String url;

  WebScreen({this.url});

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {

  bool _isLoading = true;
  final Completer<WebViewController> _webViewController = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: [
          FutureBuilder<WebViewController>(
            future: _webViewController.future,
            builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot){
              final bool webViewReady = snapshot.connectionState == ConnectionState.done;
              final WebViewController controller = snapshot.data;
              return IconButton(
                icon: Icon(Icons.replay),
                onPressed: !webViewReady? null : (){
                  setState(() {
                    _isLoading = true;

                  });
                  controller.reload();
                },
              );
          },
          )
        ],
        title: Text(
          widget.url.split('/')[2],
          style: kWebViewTextStyle,

        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isLoading? SizedBox(height: 3, child: LinearProgressIndicator()):Container(),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onPageFinished: (d){
                setState(() {
                  _isLoading = false;
                });
              },
              onWebViewCreated: (WebViewController webViewController){
                _webViewController.complete(webViewController);
              },
            ),
          )
        ],
      )
    );
  }
}
