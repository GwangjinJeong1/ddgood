import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 243,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColor.secondary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 25, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close,
                        size: 32, color: AppColor.neutral))
              ],
            ),
            const SizedBox(height: 13),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 14),
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromRGBO(149, 149, 149, 1),
                ),
                const SizedBox(width: 8),
                Text('사용자',
                    style:
                        hs21.copyWith(fontSize: 24, color: AppColor.neutral)),
                const Spacer(),
                const Icon(Icons.edit_outlined, color: AppColor.neutral)
              ],
            ),
            const SizedBox(height: 9),
            const Divider(thickness: 0.4, height: 30, color: AppColor.neutral),
            Row(
              children: [
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text(
                    '일기 쓰기',
                    style: bs17.copyWith(color: AppColor.neutral),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 0.4, height: 30, color: AppColor.neutral),
            Row(
              children: [
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/wordcloud');
                  },
                  child: Text(
                    '워드 클라우드',
                    style: bs17.copyWith(color: AppColor.neutral),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 0.4, height: 30, color: AppColor.neutral),
            Row(
              children: [
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/calendar');
                  },
                  child: Text('일기 기록',
                      style: bs17.copyWith(color: AppColor.neutral)),
                ),
              ],
            ),
            const Divider(thickness: 0.4, height: 30, color: AppColor.neutral),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 9),
                Text(
                  '설정',
                  style: bs17.copyWith(color: AppColor.neutral),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 9),
                Text(
                  '로그아웃',
                  style: bs17.copyWith(color: AppColor.neutral),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
