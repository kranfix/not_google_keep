import 'package:provider/provider.dart';

import 'data/ticket_list_model.dart';
import 'ui/ticket/home/ticket_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TicketListModel>(
      builder: (BuildContext context) => TicketListModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: TicketHome(),
      ),
    );
  }
}
