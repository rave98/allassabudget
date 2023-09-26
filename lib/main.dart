import 'package:allassabudget/Homepage/homepage.dart';
import 'package:allassabudget/app_theme.dart';
import 'package:allassabudget/logger.dart';

void main() async {
  logger.info('Initializing Hive for storage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allassa Budget',
      theme: appTheme,
      home: const MyHomePage(title: 'Allassa Budget'),
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

  @override
  Widget build(BuildContext context) {
    logger.info("Building homepage");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: HomePage()
      ),
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
