import 'package:bloc_tutorial/blocs/internet_bloc/intenet_state.dart';
import 'package:bloc_tutorial/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // bloc builder can change the ui, bloc listener can change the code
          // and bloc consumer can have both the listener and builder.
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Connected"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Disconnected"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetInitialState) {
                return Text("Loading...");
              } else if (state is InternetGainedState) {
                return Text("Gained !!");
              } else {
                return Text("Lost !!");
              }
            },
          ),
        ),
      ),
    );
  }
}
