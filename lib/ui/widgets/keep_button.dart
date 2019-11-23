import 'package:flutter/material.dart';

class KeepButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const KeepButton({Key key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 50,
      buttonColor: Colors.red,
      child: RaisedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
