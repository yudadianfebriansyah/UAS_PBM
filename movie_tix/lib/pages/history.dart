import 'package:flutter/material.dart';



class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('kimi_no_nawa.jpg'),
              ),
              title: Text('Your Name'),
              subtitle: Text('By Makoto Shinkai.'),
            ),
          ],
        ),
      ),
    );
  }
}
