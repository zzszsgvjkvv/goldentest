import 'package:flutter/material.dart';

class Errorgetmealstatewidget extends StatelessWidget {
    final String mesg;
  const Errorgetmealstatewidget({super.key, required this.mesg});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(mesg),);
  }
}


