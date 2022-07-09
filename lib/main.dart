import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Query Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: const Text('Media Query Training'),
    );
    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: isLandscape
            // Landscape Position
            ? Column(
                children: [
                  Container(
                    height: bodyHeight * 0.5,
                    width: mediaQueryWidth * 1,
                    color: Colors.amber,
                  ),
                  Container(
                    height: bodyHeight * 0.5,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Item $index"),
                          tileColor: Color.fromARGB(255, Random().nextInt(255),
                              Random().nextInt(255), Random().nextInt(255)),
                        );
                      },
                    ),
                  ),
                ],
              )
            // Potrait Position
            : Column(
                children: [
                  Container(
                    height: bodyHeight * 0.3,
                    width: mediaQueryWidth * 0.7,
                    color: Colors.amber,
                  ),
                  Container(
                    height: bodyHeight * 0.7,
                    color: Colors.red,
                    child: ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Item $index"),
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
