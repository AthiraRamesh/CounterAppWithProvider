import 'package:counter_app_provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  // final List<int> numbers;
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersListProvider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // int last = widget.numbers.last;
            // setState(() {
            //   widget.numbers.add(last + 1);
            // });
            numbersListProvider.add();
          },
        ),
        appBar: AppBar(),
        body: SizedBox(
          child: Column(
            children: [
              Text(
                numbersListProvider.numbers.last.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbersListProvider.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numbersListProvider.numbers[index].toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     // int last = widget.numbers.last;
      //     // setState(() {
      //     //   widget.numbers.add(last + 1);
      //     // });
      //   },
      // ),
    );
  }
}
