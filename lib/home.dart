import 'package:counter_app_provider/list_provider.dart';
import 'package:counter_app_provider/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<int> numbers = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersProviderModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersProviderModel.add();
            // int last = numbers.last;
            // setState(() {
            //   numbers.add(last + 1);
            // });
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: SizedBox(
          child: Column(
            children: [
              Text(
                numbersProviderModel.numbers.last.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: numbersProviderModel.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numbersProviderModel.numbers[index].toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Second(),
                    ));
                  },
                  child: Text('Second'))
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     // int last = numbers.last;
      //     // setState(() {
      //     //   numbers.add(last + 1);
      //     // });
      //   },
      // ),
    );
  }
}
