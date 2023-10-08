import 'package:allassabudget/Storage/Models/expense.dart';
import 'package:allassabudget/logger.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:image_picker/image_picker.dart';

/// HomePage of the application, displaying basic information
class HomePage extends StatelessWidget {
  late ImagePicker _imagePicker;

  HomePage({super.key}) {
    _imagePicker = ImagePicker();
  }

  void pickImage() async {
    logger.info("Opening camera");
    XFile? newImage = await _imagePicker.pickImage(source: ImageSource.camera);

    if(newImage == null) {
      return; // TODO: add snackbar / toast message for user, 'Failed retrieving image'
    }
    
    logger.info("Saving image");
    newImage.saveTo(
      // path + filename
      (await getApplicationDocumentsDirectory()).path + DateTime.now().millisecondsSinceEpoch.toString()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: pickImage, 
          child: Icon(Icons.add_circle, color: Theme.of(context).primaryColor, size: 300,),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text("Entrate!!", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.green),),
             Text("Uscite!!", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.red),)
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

