import '../../../models/ticket.dart';
import 'package:flutter/material.dart';

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
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ticket.cardColor[400],
            ticket.cardColor[200],
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: ticket.cardColor[200].withOpacity(0.7),
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: Offset(1.0, 1.0),
          )
        ],
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -100,
            top: -20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(Radius.circular(300)),
              ),
            ),
          ),
          ListTile(
            onTap: showDetail,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.note,
                color: ticket.cardColor,
              ),
            ),
            title: Text(
              ticket.title,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: true,
            ),
            subtitle: Text(
              ticket.description,
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: removeTicket,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
