import 'package:keep/data/ticket_list_model.dart';
import 'package:provider/provider.dart';
import 'ticket_item.dart';
import 'package:flutter/material.dart';

class TicketHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TicketListModel>(
        builder: (BuildContext context, TicketListModel ticketListModel,
            Widget child) {
          return ListView.builder(
            itemCount: ticketListModel.tickets.length,
            itemBuilder: (BuildContext context, int index) {
              return TicketItem(title: ticketListModel.tickets[index]?.title);
            },
          );
        },
      ),
    );
  }
}
