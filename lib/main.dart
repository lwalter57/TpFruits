import 'package:flutter/material.dart';

void main() {
  runApp(const FruitsApp());
}

Color WhichColor(int counter) {
  if (counter % 2 == 0) {
    return Color.fromARGB(255, 39, 194, 215);
  } else {
    return Color.fromARGB(255, 60, 72, 140);
  }
}

Image WhichImage(int item) {
  if (item % 2 == 0) {
    return Image.asset('assets/images/pomme.png');
  } else {
    return Image.asset('assets/images/poire.png');
  }
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomme, poire et ananas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FruitList(),
    );
  }
}

class FruitList extends StatefulWidget {
  const FruitList({super.key});

  @override
  State<FruitList> createState() => _FruitList();
}

class _FruitList extends State<FruitList> {
  int _counter = 0;
  final List<int> _fruitList = <int>[];

  void incrementCounter() {
    setState(
      () {
        _counter++;
        _fruitList.add(_counter);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_counter : Nombre de fuits'),
      ),
      body: ListView.builder(
        itemCount: _fruitList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: WhichColor(_fruitList[index]),
            child: Row(
              children: [
                Text(
                  '${_fruitList[index]}',
                  style: const TextStyle(color: Colors.white),
                ),
                WhichImage(_fruitList[index]),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => incrementCounter(),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
