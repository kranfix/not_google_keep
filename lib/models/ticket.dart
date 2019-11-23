// import 'package:flutter/widgets.dart';

/*class Ticket{
  final String title;
  Ticket({@required this.title}):assert(title!=null);
}*/

// class Ticket {
//   String _title;
//   Ticket({@required title}) : _title = title;

//   set title(String title) => _title = title;
//   String get title => _title ?? "Untitled";
// }

class Ticket {
  final String id;
  final String title;
  final String description;

  Ticket({String id, String title, String description})
      : this.id = id ?? '',
        this.title = title ?? 'untitled',
        this.description = description ?? '';
}
