import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/blocs/blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialPosition;
  const MapView({Key? key, required this.initialPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition = CameraPosition(
      target: initialPosition,
      zoom: 15,
    );
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (controller) =>
            mapBloc.add(OnMapInitializedEvent(controller)),
      ),
    );
  }
}
