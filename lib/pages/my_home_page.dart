import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/counting_the_number.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Provider Explained to Beginners',
        ),
      ),
      body: const Center(
        child: AVeryDeepWidgetTree(),
      ),
    );
  }
}

class AVeryDeepWidgetTree extends StatelessWidget {
  const AVeryDeepWidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    // ‘Provider.of’, just like Consumer needs to know the type of the model.
    //We need to specify the model ‘CountingTheNumber’.
    final counter = Provider.of<CountingTheNumber>(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'This is a simple Text Widget',
            style: TextStyle(
              color: Colors.black,
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          //now we are going to build a very deep widget tree
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'This is another simple Text widget deep inside the tree.',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${counter.number}',
                  style: const TextStyle(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                FloatingActionButton(
                  onPressed: () {
                    counter.increaseNumber();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
