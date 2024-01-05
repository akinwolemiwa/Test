            import 'package:flutter/material.dart';
            import 'package:provider/provider.dart';

            class CounterModel extends ChangeNotifier {
              int _count = 0;
              int get count => _count;

              void increment() {
                _count++;
                notifyListeners();
              }
            }

            class CounterTab extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                // Using Provider to get the CounterModel
                final counterModel = Provider.of<CounterModel>(context);

                return Scaffold(
                  appBar: AppBar(
                    title: Text('Counter Tab'),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Count:',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '${counterModel.count}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      // Bug: Incrementing the count directly without using the CounterModel method
                      // This leads to the UI not being updated
                      counterModel._count++;
                    },
                    child: Icon(Icons.add),
                  ),
                );
              }
            }

