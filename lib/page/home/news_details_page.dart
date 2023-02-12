import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatefulWidget {
  final String link;
  final String title;
  final String image;

  NewsDetails({required this.link, required this.title, required this.image});

  @override
  State<NewsDetails> createState() => _NewsDetailsState(link, title, image);
}

class _NewsDetailsState extends State<NewsDetails> {
  WebViewController? _controller;
  bool isLoading = true;

  final String link;
  final String title;
  final String image;

  _NewsDetailsState(this.link, this.image, this.title);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Container(
            width: double.maxFinite,
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.contain,
                    height: 32,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            WebViewWidget(controller: _controller!),
            isLoading
                ? Container(
                    alignment: Alignment.topCenter,
                    child: LinearProgressIndicator(),
                  )
                : Container(),
          ],
        ));
  }
}
