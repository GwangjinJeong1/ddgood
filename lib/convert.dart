import 'package:ddgood/completion.dart';
import 'package:flutter/material.dart';

import 'drawer/drawer.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({
    super.key,
  });

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  // 변수 추가
  bool isTextConverted = false;

  @override
  void initState() {
    super.initState();

    // 2초 뒤에 isTextConverted를 true로 설정
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isTextConverted = true;
      });
    });
    // 4초 뒤에 isTextConverted를 true로 설정
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CompletionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              iconSize: 25,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.black87,
        title: const Text(
          '서비스명',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      drawer: const MyDrawer(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Center(
          key: ValueKey<bool>(isTextConverted),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 118),
              Text(
                isTextConverted ? '변환이\n완료되었어요' : '텍스트로\n변환중!',
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 59.5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTextConverted = true;
                  });
                },
                child: SizedBox(
                    width: 181,
                    height: 181,
                    child: isTextConverted
                        ? Image.asset("assets/images/Check.png")
                        : Image.asset("assets/images/Text.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
