import 'package:flutter/material.dart';


class Treatment extends StatefulWidget {
  Treatment({Key? key}) : super(key: key);

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('hello treatment'),);
  }
}