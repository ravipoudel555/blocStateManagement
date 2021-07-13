import 'dart:developer';

import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const TextStyle kFontStyle = TextStyle(
  fontSize: 50,
  color: Colors.purpleAccent,
);

const Color pageColor = Colors.purpleAccent;

class ThirdScreen extends StatelessWidget {
  final String title;
  const ThirdScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(title);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pageColor,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            BlocConsumer<CounterCubit, CounterState>(
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
                    color: pageColor,
                    child: Icon(Icons.remove),
                  ),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                ),
                MaterialButton(
                  child: Container(
                    color: pageColor,
                    child: Icon(Icons.add),
                  ),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
