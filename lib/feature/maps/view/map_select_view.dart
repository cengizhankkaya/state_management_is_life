import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:state_management_is_life/feature/maps/model/map_model.dart';
import 'package:state_management_is_life/feature/maps/services/map_services.dart';
import 'package:state_management_is_life/feature/maps/viewmodel/map_view_model.dart';
import 'package:state_management_is_life/product/init/network_product.dart';
import 'package:state_management_is_life/product/utility/extension/map_model_markers.dart';

class MapSelectView extends StatefulWidget {
  MapSelectView({super.key});

  @override
  State<MapSelectView> createState() => _MapSelectViewState();
}

class _MapSelectViewState extends State<MapSelectView> {
  late final MapViewModel _mapViewModel;
  final double _cardSize = 200;

  GoogleMapController? _googleMapController;

  @override
  void initState() {
    super.initState();
    _mapViewModel = MapViewModel(
      MapService(NetworkProduct.instance.networkManager),
    );
    _mapViewModel.fetchAllMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _googleMaps(),
          Positioned(
            height: _cardSize,
            right: 0,
            left: 0,
            bottom: kToolbarHeight,
            child: _pageViewAnimals(),
          ),
        ],
      ),
    );
  }

  Widget _pageViewAnimals() {
    return Observer(
      builder: (_) {
        return PageView.builder(
          itemCount: _mapViewModel.mapModelItems.length,
          controller: PageController(viewportFraction: 0.8),
          onPageChanged: (value) {
            _mapViewModel.changeIndex(value);
            _googleMapController?.animateCamera(
              CameraUpdate.newLatLng(
                _mapViewModel.mapModelItems[value].latlong,
              ),
            );
          },
          itemBuilder: (context, index) {
            return Card(
              child: Image.network(
                _mapViewModel.mapModelItems[index].detail?.photoUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/ic_order.png',
                  ); // Veya başka bir yerel resim
                },
              ),
            );
          },
        );
      },
    );
  }

  Observer _googleMaps() {
    return Observer(
      builder: (_) {
        return _mapViewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : GoogleMap(
                onMapCreated: (controller) {
                  _googleMapController = controller;
                },
                markers: _mapViewModel.mapModelItems.toMarkers(
                  _mapViewModel.selectedIndex,
                ),
                initialCameraPosition: CameraPosition(
                  target: _mapViewModel.mapModelItems.first.latlong,
                  zoom: 12,
                ),
              );
      },
    );
  }
}
