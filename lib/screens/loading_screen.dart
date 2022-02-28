import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_app/blocs/blocs.dart';
import 'package:map_app/screens/gps_access_screen.dart';
import 'package:map_app/screens/map_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (BuildContext context, state) {
          return state.isAllReady ? const MapScreen() : const GpsAccessScreen();
        },
      ),
    );
  }
}
