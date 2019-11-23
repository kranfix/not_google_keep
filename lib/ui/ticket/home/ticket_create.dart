import 'package:flutter/material.dart';
import 'package:keep/models/ticket.dart';
import 'package:keep/ui/widgets/keep_button.dart';

class TicketCreate extends StatefulWidget {
  @override
  _TicketCreateState createState() => _TicketCreateState();
}

class _TicketCreateState extends State<TicketCreate> {
  Ticket ticket = Ticket();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                return value == "" ? "El titulo no puede estar vacio" : null;
              },
            ),
            TextFormField(
              validator: (value) {
                return value == "" ? "El contenido no puede estar vacio" : null;
              },
              maxLines: 5,
            ),
            Builder(
              builder:(BuildContext context){
                return KeepButton(
                  child: Text("Guardar ticket"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {

                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Error"),
                      ));
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
