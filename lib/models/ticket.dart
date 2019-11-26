import 'package:nuid/nuid.dart';

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

import 'dart:math';
import 'package:flutter/material.dart';

class Ticket {
  final String id;
  final String title;
  final String description;
  final MaterialColor cardColor;

  Ticket({String id, String title, String description})
      : this.id = id ?? nuid.next(), // Ensure a different id
        this.title = title ?? 'untitled',
        this.description = description ?? '',
        this.cardColor = colors[Random().nextInt(colors.length)];
}

final List colors = [
  Colors.pink,
  Colors.blue,
  Colors.amber,
  Colors.cyan,
  Colors.deepPurple
];
