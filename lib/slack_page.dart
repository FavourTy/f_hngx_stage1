import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SlackPage extends StatefulWidget {
  SlackPage({super.key});

  @override
  State<SlackPage> createState() => _SlackPageState();
}

class _SlackPageState extends State<SlackPage> {
  bool webPage = true;

  final String githubProfileLink = "https://github.com/favourTy";

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(githubProfileLink));
  }

  @override
  Widget build(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;

    return webPage
        ? SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: const Text(
                  " My Slack Profile",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.black,
              body: Center(
                child:(orientation == Orientation.portrait) ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 150.0,
                        backgroundImage: AssetImage("assets/images/image1.jpg"),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Adeyemi Favour Adetayo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                        width: 300,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              setState(() {
                                webPage = !webPage;
                              });
                            },
                            child: const Text(
                              "Open Github",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            )),
                      ),
                    ]) : Row(
                      children: [
                        const CircleAvatar(
                        radius: 150.0,
                        backgroundImage: AssetImage("assets/images/image1.jpg"),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        children: [
                          Spacer(),
                           const Text(
                        "Adeyemi Favour Adetayo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                        width: 300,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              setState(() {
                                webPage = !webPage;
                              });
                            },
                            child: const Text(
                              "Open Github",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            )),
                      ),
                      Spacer(),
                        ],
                      )
                      ],
                    )
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(child: WebViewWidget(controller: _controller)),
          );
  }
}
