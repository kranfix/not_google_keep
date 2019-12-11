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
  final TextStyle _hintStyle = TextStyle(fontSize: 20);
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

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
        content: Text('Ingresar campos obligatorios.'),
      ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Agregar nota',
            style:
                theme.textTheme.headline.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        focusNode: _titleFocus,
                        onFieldSubmitted: (_) {
                          _titleFocus.unfocus();
                          FocusScope.of(context)
                              .requestFocus(_descriptionFocus);
                        },
                        style: Theme.of(context).textTheme.display1,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Título',
                        ),
                        onChanged: (value) => setState(() => _title = value),
                        validator: (value) =>
                            value.isEmpty ? 'Campo requerido' : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        focusNode: _descriptionFocus,
                        style: theme.textTheme.body1,
                        maxLines: 10,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Nota', hintStyle: _hintStyle),
                        onChanged: (value) =>
                            setState(() => _description = value),
                        validator: (value) =>
                            value.isEmpty ? 'Campo requerido' : null,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton.extended(
              backgroundColor: Colors.white,
              label: Text(
                'Guardar Nota',
                style: TextStyle(color: Colors.blue),
              ),
              icon: Icon(
                Icons.save,
                color: Colors.blue,
              ),
              onPressed: () => _submit(context),
            );
          },
        ));
  }
}
