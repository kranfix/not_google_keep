import 'package:keep/data/ticket_list_model.dart';
import 'package:keep/models/ticket.dart';
import 'package:keep/ui/ticket/home/ticket_create.dart';
import 'package:provider/provider.dart';
import 'ticket_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TicketHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
                return TicketCreate();
          }));
        },
      ),
      body: Consumer<TicketListModel>(
        builder: (BuildContext context, TicketListModel ticketListModel,
            Widget child) {
          return ListView.builder(
            shrinkWrap: true,
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
