import 'package:bk_flutter/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new DetailPage(),
      ),
    );
  },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
