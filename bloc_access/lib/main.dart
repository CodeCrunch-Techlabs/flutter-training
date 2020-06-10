import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
 
  @override
  int get initialState =>  0; 
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield  state - 1;
        break;
      case CounterEvent.increment:
        yield  state + 1;
        break;
    }
  }
}
 
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<CounterPage>(
                builder: (context) {
                  return BlocProvider.value(
                    value: counterBloc,
                    child: CounterPage(),
                  );
                },
              ),
            );
          },
          child: Text('Counter'),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 0,
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 1,
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text('$count'),
          );
        },
      ),
    );
  }
}
