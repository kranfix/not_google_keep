import '../../../data/ticket_list_model.dart';
import '../../../models/ticket.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketCreate extends StatefulWidget {
  @override
  _TicketCreateState createState() => _TicketCreateState();
}

class _TicketCreateState extends State<TicketCreate> {
  // Ticket _ticket = Ticket();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _title;
  String _description;

  _submit(context) {
    if (_formKey.currentState.validate()) {
      Provider.of<TicketListModel>(context).addTicket(
        Ticket(
          id: Random().nextInt(9000).toString(),
          title: _title,
          description: _description,
        ),
      );

      Navigator.of(context).pop();
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Error'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agregar nota'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: Theme.of(context).textTheme.display1,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Titulo',
                  ),
                  onChanged: (value) => setState(() => _title = value),
                  validator: (value) =>
                      value.isEmpty ? 'Campo requerido' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  style: Theme.of(context).textTheme.body1,
                  maxLines: 6,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nota',
                  ),
                  onChanged: (value) => setState(() => _description = value),
                  validator: (value) =>
                      value.isEmpty ? 'Campo requerido' : null,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton.extended(
              label: Text('Guardar Ticket'),
              icon: Icon(Icons.add),
              onPressed: () => _submit(context),
            );
          },
        ));
  }
}
