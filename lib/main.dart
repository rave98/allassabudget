import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:allassabudget/Storage/storage.dart';
import 'package:allassabudget/Pages/AddExpenseManually/add_expense_manually.dart';
import 'package:allassabudget/Pages/BudgetCap/budget_cap.dart';
import 'package:allassabudget/Pages/Categories/categories.dart';
import 'package:allassabudget/Pages/RecurringExpenses/recurring_expenses.dart';
import 'package:allassabudget/Pages/Homepage/homepage.dart';
import 'package:allassabudget/app_theme.dart';
import 'package:allassabudget/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  setupLogger();
  Storage.setupLocalStorage();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAA Budget',
      theme: appTheme,
      home: const MyHomePage(title: 'AAA Budget'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    RecurringExpenses(),
    AddExpenseManually(),
    HomePage(),
    BudgetCap(),
    Categories()
  ];

  @override
  Widget build(BuildContext context) {
    logger.info("Building homepage");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int selectedIndex) => setState(() => _currentIndex = selectedIndex),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.restart_alt), label: 'Recurring expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add expense'),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.stop_circle), label: 'Budget cap'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        ]),
    );
  }
}
