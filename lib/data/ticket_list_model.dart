import 'package:flutter/cupertino.dart';

import '../models/ticket.dart';

class TicketListModel  extends ChangeNotifier{
  List<Ticket> _tickets = [
    Ticket(title: "Ticket 001"),
    Ticket(title: "Ticket 002"),
    Ticket(title: "Ticket 003"),
    Ticket(title: "Ticket 004"),
    Ticket(title: "Ticket 005"),
  ];

  List<Ticket> get tickets => _tickets;

  void addTicket(Ticket ticket){
    _tickets.add(ticket);
    notifyListeners();
  }

}
