import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';
import 'drawer.dart';

class WordCloudPage extends StatefulWidget {
  const WordCloudPage({
    super.key,
  });

  @override
  State<WordCloudPage> createState() => _WordCloudPageState();
}

class _WordCloudPageState extends State<WordCloudPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondary,
        title: const Text('워드클라우드', style: hm21),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: AppColor.neutral),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: <Widget>[
            const Row(
              children: [
                Text(
                  '12월 2주',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
                width: 207,
                height: 207,
                child: Image.asset("assets/images/home_image.png")),
          ],
        ),
      ),
    );
  }
}
