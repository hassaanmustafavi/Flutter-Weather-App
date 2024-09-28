import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon; 
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
    
    
    });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding:  const EdgeInsets.all(8.0),
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(height: 5,),
            Text(
              temperature
            )
          ],
        ),
      ),
    );
  }
}