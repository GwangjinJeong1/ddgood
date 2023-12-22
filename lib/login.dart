import 'package:ddgood/home.dart';
import 'package:ddgood/utils/color_scheme.dart';
import 'package:ddgood/utils/text_theme.dart';
import 'package:flutter/material.dart';

import 'drawer/drawer.dart';
import 'talk.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset("assets/images/Splash.png"),
          Positioned(
              top: 506,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Container(
                  width: 343,
                  height: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColor.primary,
                      width: 1,
                    ),
                    color: AppColor.neutral2,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 18),
                      Image.asset(
                        "assets/images/google.png",
                        width: 34,
                        height: 34,
                      ),
                      const SizedBox(width: 49),
                      Text("Google로 계속하기",
                          style: bm17.copyWith(
                              fontSize: 18, color: AppColor.text)),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
