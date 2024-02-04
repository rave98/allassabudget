import 'package:allassabudget/Storage/Models/expense.dart';
import 'package:allassabudget/TextRecognition/text_detector_view.dart';
import 'package:allassabudget/logger.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:image_picker/image_picker.dart';

/// HomePage of the application, displaying basic information
class HomePage extends StatelessWidget {
  HomePage({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new TextRecognizerView())), 
          child: Icon(Icons.add_circle, color: Theme.of(context).primaryColor, size: 300,),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             FutureBuilder(
              future: Storage.gains(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Text(snapshot.data.toString(), style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.green),);
                }
                else {
                  return const CircularProgressIndicator();
                }
              }),
            FutureBuilder(
              future: Storage.losses(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Text(snapshot.data.toString(), style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.red),);
                }
                else {
                  return const CircularProgressIndicator();
                }
              }),
          ],
        ),
        FutureBuilder(
          future: Storage.categoryGroupedExpenses(), 
          builder: (BuildContext context, AsyncSnapshot<Map<String, double>> snapshot) {
            if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
              return PieChart(
                colorList: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColorLight
                ],
                dataMap: snapshot.data!
              );
            } else if (snapshot.hasData && snapshot.data != null && snapshot.data!.isEmpty) {
              return const Center(child: Text("No expenses added yet!"),);
            } else if (snapshot.hasError) {
              return const Center(child: Text("We had a problem retrieving your expenses"),);
            } else {
              return const CircularProgressIndicator();
            }
        },)
      ],
    );
  }
}

