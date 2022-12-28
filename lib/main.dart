import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;


void main() async {
  runApp(const MyApp());

  final pdf = pw.Document();

  //   static const double cm = inch / 2.54;
  //   static const double mm = inch / 25.4;

  double inch = 72.0;
  double cm = inch / 2.54;
  double mm = inch / 25.4;

  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Stack(
          alignment: pw.Alignment.topCenter,
          children: [
            pw.Container(
              padding: pw.EdgeInsets.all(2*cm),
              child: pw.Text('Hello World!'),
            ),
            pw.Text('Hello World! 2'),
          ],
        );
        return pw.Center(
          child: pw.Text('Hello World!'),
        );
      },
    ),
  );

  download(Stream.fromIterable((await pdf.save()).buffer.asUint8List()), "example.pdf");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
