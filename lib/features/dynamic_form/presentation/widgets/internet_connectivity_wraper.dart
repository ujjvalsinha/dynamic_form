// Wrapper widget to handle internet connectivity changes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/cubit/connectivity_cubit.dart';

class InternetConnectivityWrapper extends StatelessWidget {
  final Widget child;

  const InternetConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConnectivityCubit(),
      child: InternetConnectivityHandler(child: child),
    );
  }
}

// Widget to handle UI based on internet connectivity
class InternetConnectivityHandler extends StatelessWidget {
  final Widget child;

  const InternetConnectivityHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, bool>(
      listener: (context, isConnected) {
        if (!isConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No internet connection'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      child: child,
    );
  }
}
