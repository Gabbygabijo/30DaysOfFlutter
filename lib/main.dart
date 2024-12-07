import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://gabijo-portfolio.netlify.app/'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Gabriel\'s Website')),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: WebViewWidget(controller: _controller),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            child: OverflowBar(
              children: [
                navigationButton(
                    Icons.chevron_left, _controller.canGoBack, _goBack),
                navigationButton(
                    Icons.chevron_right, _controller.canGoForward, _goForward),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationButton(IconData icon, Future<bool> Function() canNavigate,
      Function(WebViewController) onPressed) {
    return FutureBuilder<bool>(
      future: canNavigate(), // Correctly assign the future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            onPressed: snapshot.data! ? () => onPressed(_controller) : null,
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _goBack(WebViewController controller) async {
    if (await controller.canGoBack()) {
      controller.goBack();
    }
  }

  void _goForward(WebViewController controller) async {
    if (await controller.canGoForward()) {
      controller.goForward();
    }
  }
}
