import 'package:flutter/material.dart';

class WeekForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;
  const WeekForecastCard({super.key, required this.time, required this.icon, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, bottom: 10,),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: Container(
          width: 100,
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10,),
              Text('$time',
                style: TextStyle(fontSize: 16,
                ),
              ),
              const SizedBox(height: 16,),
              Icon(icon,
                size: 32,),

              const SizedBox(height: 16,),
              Text('$temp' + '°C', style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold)),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
