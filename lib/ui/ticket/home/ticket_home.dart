import 'ticket_detail.dart';
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

  _goDetailTicket(context, ticket) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TicketDetail(ticket: ticket)));
  }

  _goAddPage(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return TicketCreate();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _goAddPage(context),
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
                showDetail: () => _goDetailTicket(context, ticket),
              );
            },
          );
        },
      ),
    );
  }
}
