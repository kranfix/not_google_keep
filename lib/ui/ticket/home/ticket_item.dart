import 'package:flutter/material.dart';

class TicketItem extends StatelessWidget {
  final String title;
  TicketItem({this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Container(
        height: 50.0,
        width: 50.0,
        child: Text(title),
      ),
    );
  }
}
