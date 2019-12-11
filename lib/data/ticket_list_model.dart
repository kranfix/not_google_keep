import 'package:flutter/cupertino.dart';

import '../models/ticket.dart';

class TicketListModel extends ChangeNotifier {
  List<Ticket> _tickets = [];

  List<Ticket> get tickets => _tickets;

  void addTicket(Ticket ticket) {
    _tickets.add(ticket);
    notifyListeners();
  }

  removeTicket(String id) {
    _tickets.removeWhere((t) => t.id == id);
    notifyListeners();
  }
  cleanTickets() {
    _tickets.clear();
    notifyListeners();
  }
}
