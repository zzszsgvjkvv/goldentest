import 'package:flutter/material.dart';

class Lodingstatwidget extends StatelessWidget {
  const Lodingstatwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
