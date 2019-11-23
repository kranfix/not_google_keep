import 'ticket_item.dart';
import '../../../data/ticket_list_model.dart';
import '../../../models/ticket.dart';
import '../../../ui/ticket/home/ticket_create.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TicketHome extends StatelessWidget {
  _removeTicket(context, id) {
    Provider.of<TicketListModel>(context).removeTicket(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
      ),
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
              final Ticket ticket = ticketListModel.tickets[index];
              return TicketItem(
                ticket: ticket,
                removeTicket: () => _removeTicket(context, ticket.id),
              );
            },
          );
        },
      ),
    );
  }
}
