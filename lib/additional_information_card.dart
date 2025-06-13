import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
  final IconData icon;
  final String stat;
  final String value;
  const AdditionalInformationCard({super.key, required this.icon, required this.stat, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
          size: 52,),

        Text(stat,
          style: TextStyle(fontSize: 13),),

        Text(value,
          style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}
