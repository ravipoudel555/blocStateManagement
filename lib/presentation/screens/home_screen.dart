import 'package:bloc_flutter/constants/enums.dart';
import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:bloc_flutter/logic/cubit/internet_cubit.dart';
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
      body: Center(
        child: Column(
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Wifi',
                    style: kFontStyle,
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Mobile',
                    style: kFontStyle,
                  );
                } else if (state is InternetDisonnected) {
                  return Text('Disconnected');
                }
                return CircularProgressIndicator();
              },
            ),

            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: kFontStyle,
                );
              },
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
    );
  }
}
