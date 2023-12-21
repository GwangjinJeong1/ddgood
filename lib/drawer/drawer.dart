import 'package:flutter/material.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Spacer(), Icon(Icons.close)],
            ),
            const SizedBox(height: 13),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Color.fromRGBO(149, 149, 149, 1),
                ),
                SizedBox(width: 21),
                Text(
                  '사용자',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Spacer(),
                Icon(Icons.edit_outlined)
              ],
            ),
            const SizedBox(height: 26),
            const Divider(
              thickness: 0.4,
              color: Color.fromRGBO(149, 149, 149, 1),
            ),
            Row(
              children: [
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: const Text(
                    '홈',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 0.4,
              color: Color.fromRGBO(149, 149, 149, 1),
            ),
            Row(
              children: [
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/wordcloud');
                  },
                  child: const Text(
                    '워드 클라우드',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 0.4,
              color: Color.fromRGBO(149, 149, 149, 1),
            ),
            Row(
              children: [
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/calendar');
                  },
                  child: const Text('일기 기록',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                ),
              ],
            ),
            const Divider(
              thickness: 0.4,
              color: Color.fromRGBO(149, 149, 149, 1),
            ),
            const Spacer(),
            const Row(
              children: [
                SizedBox(width: 9),
                Text(
                  '설정',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                SizedBox(width: 9),
                Text(
                  '로그아웃',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
