import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const TextStyle kFontStyle = TextStyle(
  fontSize: 50,
  color: Colors.blueAccent,
);

class HomeScreen extends StatelessWidget {
  final String title;
  HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(title);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Incremented'),
                duration: Duration(milliseconds: 500),
              ),
            );
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Decremented'),
                duration: Duration(milliseconds: 500),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: kFontStyle,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    child: Container(
                      color: Colors.blueAccent,
                      child: Icon(Icons.remove),
                    ),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                  ),
                  MaterialButton(
                    child: Container(
                      color: Colors.blueAccent,
                      child: Icon(Icons.add),
                    ),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                  ),
                ],
              ),
              //--------------------------------Navigation buttons below-----------------------------------------
              SizedBox(height: 100),
              MaterialButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blueAccent,
                  child: Text('Go to second screen'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
              MaterialButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blueAccent,
                  child: Text('Go to third screen'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
