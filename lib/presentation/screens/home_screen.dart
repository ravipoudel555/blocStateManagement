import 'package:flutter/material.dart';

const TextStyle kFontStyle = TextStyle(
  fontSize: 50,
  color: Colors.blueAccent,
);

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(title);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '1',
              style: kFontStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Container(
                    color: Colors.blueAccent,
                    child: Icon(Icons.add),
                  ),
                  onPressed: () {},
                ),
                MaterialButton(
                  child: Container(
                    color: Colors.blueAccent,
                    child: Icon(Icons.remove),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
