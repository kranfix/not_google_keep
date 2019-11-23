import 'package:flutter/material.dart';
import '../../../models/ticket.dart';

class TicketItem extends StatelessWidget {
  TicketItem({
    @required this.ticket,
    this.removeTicket,
    this.showDetail,
  });

  final Ticket ticket;
  final VoidCallback removeTicket;
  final VoidCallback showDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        onTap: showDetail,
        leading: Icon(Icons.person),
        title: Text(ticket.title),
        subtitle: Text(
          ticket.description,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeTicket,
        ),
      ),
    );
  }
}
