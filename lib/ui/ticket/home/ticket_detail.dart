import '../../../models/ticket.dart';
import 'package:flutter/material.dart';

class TicketDetail extends StatelessWidget {
  const TicketDetail({Key key, @required this.ticket}) : super(key: key);

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ticket.cardColor[400],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: ticket.cardColor[400],
        title: Text("Detalle: ${ticket.title.toUpperCase()}",
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: 
      SingleChildScrollView(
        child: 
        Stack(
          children: <Widget>[
            Positioned(
              right: -100,
              bottom: -20,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(Radius.circular(300)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[200].withOpacity(0.2),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                    offset: Offset(1.0, 1.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    ticket.title.toUpperCase(),
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Divider(
                    thickness: 1.5,
                    color: ticket.cardColor[400],
                  ),
                  Text(
                    ticket.description,
                    style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
