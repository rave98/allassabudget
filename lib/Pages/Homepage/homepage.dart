import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

/// HomePage of the application, displaying basic information
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: () {}, 
          child: Icon(Icons.add_circle, color: Theme.of(context).primaryColor, size: 300,),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text("Entrate!!", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.green),),
             Text("Uscite!!", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.red),)
          ],
        ),
        PieChart(
          colorList: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight
          ],
          dataMap: {
            "Spesa": 100,
            "Recurring": 200,
            "Birrette": 260
          })
      ],
    );
  }
}

