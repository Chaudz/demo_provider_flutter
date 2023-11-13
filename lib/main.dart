import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';
import 'providers/contact_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<CounterProvider>(create: (context) => CounterProvider()),
      ChangeNotifierProvider<ContactProvider>(create: (context) => ContactProvider())
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CounterProvider>(builder: (context, value, child) {
              return Text('counter: ${value.counter}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
            },),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: Provider.of<CounterProvider>(context, listen: false).increment, child: Icon(Icons.add),),
                SizedBox(width: 10,),
                FloatingActionButton(onPressed: Provider.of<CounterProvider>(context, listen: false).descrement, child: Icon(Icons.remove))
              ],
            ),
            SizedBox(height: 30),
            Text('CONTACTS: ',style: TextStyle(fontWeight: FontWeight.bold),),
            Consumer<ContactProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  for(var contact in value.contacts)
                     Text('name: ${contact.name}, phone ${contact.numberPhone}')
                ],
              );
            },),
            FloatingActionButton(onPressed: (){
              var newContact = new Contact(name: "Chau bui", numberPhone: "0362091690");
              Provider.of<ContactProvider>(context,listen: false).add(newContact);
            }, child: Text('add'),)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
