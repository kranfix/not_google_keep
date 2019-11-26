import 'ticket_detail.dart';
import 'ticket_item.dart';
import '../../../data/ticket_list_model.dart';
import '../../../models/ticket.dart';
import '../../../ui/ticket/home/ticket_create.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TicketHome extends StatelessWidget {
  static void _removeTicket(context, id) =>
      Provider.of<TicketListModel>(context).removeTicket(id);

  static void _goDetailTicket(context, ticket) =>
      Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => TicketDetail(ticket: ticket),
        fullscreenDialog: true,
      ));

  static void _goAddPage(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => TicketCreate()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEEF1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Tickets',
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
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
