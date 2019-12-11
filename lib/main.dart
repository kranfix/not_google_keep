import 'data/ticket_list_model.dart';
import 'ui/ticket/home/ticket_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TicketListModel>(
      builder: (BuildContext context) => TicketListModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Keep',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TicketHome(),
      ),
    );
  }
}
